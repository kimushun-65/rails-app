require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it 'レスポンスが正常であること' do
      expect(response).to have_http_status(:ok)
    end
    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template(:new)
    end
    it '新しいuserオブジェクトがビューに渡されること' do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    context '正いユーザー情報が渡ってきた場合' do
      let(:user_params) { attributes_for(:user) }
      it 'ユーザーが作成されること' do
        expect {
          post :create, params: { user: user_params }
        }.to change(User, :count).by(1)
      end
      it 'ユーザーが1人増えていること' do
        expect {
          post :create, params: { user: user_params }
        }.to change(User, :count).by(1)
      end
      it 'マイページにリダイレクトされること' do
        post :create, params: { user: user_params }
        expect(response).to redirect_to(my_page_path)
      end
    end

    context 'ユーザー情報が不正な場合' do
      let(:invalid_user_params) { { name: nil, password: 'password', password_confirmation: 'password' } }
      
      it 'ユーザーが作成されないこと' do
        expect {
          post :create, params: { user: invalid_user_params }
        }.not_to change(User, :count)
      end

      it 'newテンプレートを再表示すること' do
        post :create, params: { user: invalid_user_params }
        expect(response).to render_template(:new)
      end

      it 'エラーメッセージが設定されること' do
        post :create, params: { user: invalid_user_params }
        expect(assigns(:user).errors).to be_present
      end
    end
  end
end