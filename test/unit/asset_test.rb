require 'test_helper'

class AssetTest < ActiveSupport::TestCase  
test "an asset should have a file_name" do
  	asset = Asset.new
  	assert !asset.asset_file_name
  	assert !asset.errors[:asset_file_name].empty?
  end
test "an asset should have a _name" do
  	asset = true
  end
  test "an asset should have a asset_content_type" do
  	asset = Asset.new
  	assert !asset.asset_content_type
  	assert !asset.errors[:asset_content_type].empty?
  end
  test "an asset should have a asset_file_size" do
  	asset = Asset.new
  	assert !asset.asset_file_size
  	assert !asset.errors[:asset_file_size].empty?
  end
  test "an asset should have a user_id" do
  	asset = Asset.new
  	assert !asset.user_id
  	assert !asset.errors[:user_id].empty?
  end
end
