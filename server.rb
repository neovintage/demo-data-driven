require 'sinatra'
require 'pg'
require 'json'

badconnection = false
begin
  conn = PG.connect( dbname: 'tpch' )
rescue => e
  badconnection = true
  connection_err = e.message
end

get '/' do
  @openorders = 0
  @orders     = []

  if !badconnection
    @openorders = conn.exec("select count(*) as order_count from orders where o_orderstatus = 'O' and o_orderdate = '1998-08-02'")
    @openorders = @openorders[0]['order_count'].to_i

    @failedorders = conn.exec("select count(*) as order_count from orders where o_orderstatus = 'F' and o_orderdate = '1995-06-15'")
    @failedorders = @failedorders[0]['order_count'].to_i

    conn.exec( "select o_orderdate as dt, sum(o_totalprice) as total from orders group by 1 order by 1 desc limit 10" ) do |result|
      result.each do |r|
        @orders << {
          'timeframe' => {
            'start' => r['dt'],
            'end'   => r['dt']
          },
          'value' => [{
            'result' => (r['total'].to_f / 1000000.0).to_i
          }]
        }
      end
    end
  end
  erb :index, :layout => :application, :locals => { :badconnection => badconnection, :connection_err => connection_err, :page => 'dashboard'}
end

get '/customers' do
  @customers = []
  if !badconnection
    @customers = conn.exec(<<-SQL
      select c_name as name
           , c_address as address
           , c_mktsegment as market_segment
           , c_acctbal as account_balance
        from customer
       where c_acctbal > 0
       limit 30
    SQL
    )
  end

  erb :customers, :layout => :application, :locals => {:badconnection => badconnection, :connection_err => connection_err, :page => 'customers'}
end
