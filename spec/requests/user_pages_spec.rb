#encoding: utf-8

require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "注册 - UCDNews" do
		before { visit signup_path }

		it { should have_content('注册UCDNews · 来了就是好同志') }
		it { should have_title('注册 - UCDNews')}
    end
end