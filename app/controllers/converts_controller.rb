require 'mini_magick'
require 'base64'
require 'tmpdir'

class ConvertsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def perform
    render status: 404 and return unless params['image_data']

    image_path = params['image_data'].path
    image = MiniMagick::Image.open(image_path)
    image.format 'png'
    image.write temp_path
    image_data = File.open(temp_path) { |img| img.read }
    encoded_data = Base64.encode64(image_data)
    File.delete(temp_path)

    render json: { image_data: encoded_data }
  end

  private

  def temp_path
    @temp_path ||= Dir.tmpdir + "/#{ ('a'..'z').to_a.shuffle[0,8].join }.png"
  end
end

