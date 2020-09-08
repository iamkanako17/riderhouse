require 'rails_helper'

describe HostUser do
  before do
    @hostuser = FactoryBot.build(:host_user)
  end

  describe 'ユーザー新規登録できる時' do
    it "全ての値が存在すると登録できる" do
      expect(@hostuser).to be_valid
    end
  end

  describe 'ユーザー新規登録うまく行かない時' do
    it 'nicknameが空の時'  do
      @hostuser.nickname = ''
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Nicknameを入力してください')
    end

    it 'hostnameが空だと登録できない' do
      @hostuser.hostname = ''
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Hostnameを入力してください')
    end

    it 'hostnameが全角平仮名、カタカナ、漢字以外だと登録できない' do
      @hostuser.hostname = 'kanako'
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Hostnameは不正な値です')
    end

    it 'hostnameに半角スペースが存在すると登録できない' do
      @hostuser.hostname = 'ライダー ハウス' 
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Hostnameは不正な値です')
    end

    it 'hostname_kanaがカタカナ以外だと登録できない' do
      @hostuser.hostname_kana = 'かなこ'
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Hostname kanaは不正な値です')
    end

    it 'phoneが12字以上だと登録出来ない' do
      @hostuser.phone = '090123456789'
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Phoneは11文字以内で入力してください')
    end

    it 'emailが空だと登録出来ない' do
      @hostuser.email = ''
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Emailを入力してください')
    end

    it 'emailに＠がないと登録できない' do
      @hostuser.email = 'sample.jp'
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Emailは不正な値です')
    end

    it 'emailが重複していると登録できない' do
      @hostuser.save
      another_user = FactoryBot.build(:host_user)
      another_user.email = @hostuser.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
    end

    it 'passwordが空だと登録できない' do
      @hostuser.password = ''
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Passwordを入力してください')
    end

    it 'passwordが５文字以下だと登録できない' do
      @hostuser.password = 'dkr7'
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Passwordは6文字以上で入力してください')
    end

    it 'passwordとpassword confirmationの二つが入力されていないと登録できない' do
      @hostuser.password_confirmation = ''
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Password confirmationとPasswordの入力が一致しません')
    end

    it 'passwordは英数字混合でないと登録できない' do
      @hostuser.password = 'aedsdkmke'
      @hostuser.valid?
      expect(@hostuser.errors.full_messages).to include('Passwordは不正な値です')
    end
  end
end
