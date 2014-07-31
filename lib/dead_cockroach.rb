require 'sinatra/base'

class DeadCockroach < Sinatra::Base
  get '/' do
    'Hello DeadCockroach!'
  end

  get '/:text' do
    respond params[:data]
  end

  def respond text
    ssfaas    = 'http://uncleclive.herokuapp.com/'
    text      = '/%s' % [
        URI.encode(params[:text][0...6])
    ]
    full_url  = URI.join(ssfaas, text)
    c         = ::Curl::Easy.new("%s" % full_url)
    c.headers = {
        'Accept' => 'application/json'
    }
    c.perform

    h = JSON.parse(c.body_str)

    n = []

    h['data'].each do |line|
      n << line.map { |i| i * 4 }
    end

    if n[0].reduce(:+) == 0
      n.shift
    elsif n[-1].reduce(:+) == 0
      n.pop
    else
      n = n[0..3] + n[5..7]
    end

    h['data'] = n
    h.to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end