class CalculateCipher
   def initialize message
      @message = message
   end

   def do
      if @message.persisted?
         shift = @message.digit % 26 # A to Z
         @message.text.unpack("U*").map do |char|
            newchar = char + shift
            newchar > 90 && newchar - 26 || newchar
         end.pack("U*")
      else
         ''
      end
   end
end
