require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest


  def setup
  	@category = Category.create(name: "sbooks")
  	@category = Category.create(name: "khabadi")
  end

  test "should show categories listing"  do
  	get categories_path
  	assert_template 'category/index'
  	assert_select "a[href=?]", category_path(@category), text: @category.name
  	assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end