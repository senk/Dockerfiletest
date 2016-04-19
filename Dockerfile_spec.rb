require "serverspec"
require "docker"

describe "Dockerfile" do
  imagename = ENV['IMAGENAME']
  image = Docker::Image.create('fromImage' => imagename)

  set :os, family: :debian
  set :backend, :docker
  set :docker_image, image.id

  def os_version
    command("lsb_release -a").stdout
  end

  it "is Ubuntu 14" do
    expect(os_version).to include("Ubuntu 14")
  end

end

