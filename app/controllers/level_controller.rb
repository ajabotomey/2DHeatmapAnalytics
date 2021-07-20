require 'json'
#require 'error_handler'

class LevelController < ApplicationController
    #include Error:ErrorHandler

    def get_parsed_body
		# parse body send in json
        request.body.rewind
        request_body = request.body.read
        if request_body.empty? then request_body = "{}" end
        JSON.parse(request_body)
    end

    def error_msg(error_msg)
        #raise Error::CustomError.new("false", 666, msg)
    end

end