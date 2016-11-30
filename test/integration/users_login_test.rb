require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

    def setup
      @user = users(:amon)
    end

    test "login with valid information" do
        get login_path
        post login_path, params: {session: {email: @user.email, password: 'mon_mot_de_passe'}}
        assert_redirected_to @user
        follow_redirect!
        assert_template 'users/show'
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user)
        delete logout_path
        assert_not is_logged_in?
        assert_redirected_to home_path
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path, count: 0
        assert_select "a[href=?]", user_path(@user), count: 0
        delete logout_path
        assert_not is_logged_in?
        assert_redirected_to home_path
        delete logout_path
        follow_redirect!
    end


end
