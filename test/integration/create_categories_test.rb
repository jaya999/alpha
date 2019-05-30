require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    def setup
      @user = User.create(username: "john", email: "john@example.com", password: "password")
    end

    	
	test "get new category form and create category" do
	  sign_in_as(@user, "password") 
	  get new_category_path
	  assert_template 'categories/new'
	  assert_difference 'Category.count', 1 do
	    post categories_path, params: { category:{name: "sports"}}
	  end
	  assert_template 'category/index'
	  assert_match "sports", response.body 
	end
	test "should redirect create when admin not logged in" do
		assert_no_difference 'Category.count' do
			post categories_path, params:{category:{name: "sports"}}
		end
		assert_redirected_to categories_path
	end
end