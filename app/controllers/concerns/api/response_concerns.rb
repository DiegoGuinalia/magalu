module API
  module ResponseConcerns
    def json_error_response(messages, status = :unprocessable_entity)
      body = json_response_body('failure', messages)
      render status: status, json: body
    end

    def json_success_response(object, status = :ok)
      body = json_response_body('success', [], object)
      render status: status, json: body
    end

    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def json_array_response(object, serializer, status = :ok)
      render json: serialize_array(object, serializer), status: status
    end

    def json_pagination(objects, serializer, status = :ok)
      render json: {
        pagination: {
          found: objects.count,
          pages: objects.total_pages,
          current_page: objects.current_page,
          per_page: objects.limit_value
        },
        entries: serialize_array(objects, serializer)
      }, status: status
    end

    private

    def serialize_array(objects, serializer)
      ActiveModel::Serializer::CollectionSerializer.new(objects, each_serializer: serializer)
    end

    # always try to return an Array of plain strs
    def normalize_messages(messages)
      if messages.kind_of?(String)
        [messages]
      elsif messages.kind_of?(Array)
        messages.map { |m| normalize_messages(m) }.flatten
      elsif messages.kind_of?(Hash)
        messages.keys.map do |key|
          value = messages[key]
          '%s %s' % [key, normalize_messages(value).join(',')]
        end
      else
        [messages.to_s]
      end
    end

    def json_response_body(result, messages = [], data = nil)
      {
        result: result,
        request_id: (request.request_id rescue nil),
        messages: normalize_messages(messages),
        data: data
      }
    end
  end
end
