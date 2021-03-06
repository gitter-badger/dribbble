require 'sinatra/base'

module DribbbleAPI
  class Base < Sinatra::Base
    protected

    def json_response(response_code, file_name)
      content_type :json
      status response_code
      File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
    end
  end

  class UserSuccess < Base
    get '/*' do
      json_response 200, 'user_success.json'
    end
  end

  class BucketsSuccess < Base
    get '/*' do
      json_response 200, 'buckets_success.json'
    end
  end

  class Created < Base
    post '/*' do
      status 202
      {}.to_json
    end
  end

  class NotFound < Base
    get '/*' do
      json_response 404, 'not_found.json'
    end
  end

  class Unauthorized < Base
    get '/*' do
      json_response 401, 'unauthorized.json'
    end
  end
end
