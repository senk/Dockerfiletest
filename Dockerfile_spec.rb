require "serverspec"
require "docker"

describe "Dockerfile" do
  imagename = "docker.senk.biz:18444/myapp:" + ENV['BUILD_TAG']
  image = Docker::Image.build_from_dir('.')

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

