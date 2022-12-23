require 'sinatra/base'
require 'haml'
require 'kramdown'
require 'curb'
require 'json'

require_relative 'dead_cockroach/squasher'

class DeadCockroach < Sinatra::Base
  @@locals = {
    :github          => {
      :user    => 'pikesley',
      :project => 'dead-cockroach',
      :ribbon  => 'right_gray_6d6d6d'
    }
  }

  get '/' do
    haml :readme, :locals => @@locals.merge(
        {
            :title => 'Bridging the gap between Pokrovsky and Uncle Clive.'
        }
    )
  end

  get '/:text' do
    respond params[:data]
  end

  def respond text
    ssfaas    = 'http://uncle-clive:%s' % [
      ENV['CLIVE_PORT']
    ]
    text      = '/font/%s' % [
        URI.encode(params[:text][0...6])
    ]
    full_url  = URI.join(ssfaas, text)
    c         = Curl::Easy.new("%s" % full_url)
    c.headers = {
        'Accept' => 'application/json',
        'API-Version' => 1
    }
    c.perform

    h = JSON.parse(c.body_str)

    h['data'] = Squasher.new(h['data']).squashed

    n = []
    h['data'].each do |line|
      n << line.map { |i| i * 4 }
    end

    h['data'] = n
    h.to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
