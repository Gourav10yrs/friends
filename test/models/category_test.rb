require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    # every thing we do here remains here only like there will be no changes in your db 
    # the db made here will remain in the test db only
    # every time you run a test the setup will run first
    def setup
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do 
        assert @category.valid?
    end

    test "category name should be present" do 
        @category.name = " "
        assert_not @category.valid?
    end

    test "category should be unique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "category should not be too long" do 
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "category should not be too short" do
        @category.name = "aa"
        assert_not @category.valid? 
    end
end