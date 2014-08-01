require 'sinatra/base'
require 'haml'
require 'kramdown'
require 'curb'
require 'json'

class DeadCockroach < Sinatra::Base
  @@locals = {
    :bootstrap_theme => '../lavish-bootstrap.css',
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
    ssfaas    = 'http://uncleclive.herokuapp.com/'
    text      = '/%s' % [
        URI.encode(params[:text][0...6])
    ]
    full_url  = URI.join(ssfaas, text)
    c         = Curl::Easy.new("%s" % full_url)
    c.headers = {
        'Accept' => 'application/json'
    }
    c.perform

    h = JSON.parse(c.body_str)

    n = []

    h['data'].each do |line|
      n << line.map { |i| i * 4 }
    end



    chars = []
    n.each do |line|
      count = 0
      line.each_slice(8).to_a.each do |piece|
        chars[count] = [] if chars[count].nil?
        chars[count] << piece
        count += 1
      end
    end

    fixed_chars = []
    chars.each do |char|
      if char[0].reduce(:+) == 0
        puts 'blank top row'
        char.shift
      elsif char[-1].reduce(:+) == 0
        puts 'blank bottom row'
        char.pop
      else
        puts 'compressing'
        char = char[0..3] + n[5..7]
      end

      fixed_chars << char
    end

    fixed_chars.each do |fc|
      fc.each do |line|
        puts line.inspect
      end
      puts ''
    end

    h['data'] = out
    h.to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
