class Cleverbot
  class Errors
    class IncorrectCredentialsError < StandardError
      def message
        'Incorrect API credentials.'
      end
    end

    class DuplicatedReferenceNamesError < StandardError
      def message
        'Reference name already exists.'
      end
    end
  end
end