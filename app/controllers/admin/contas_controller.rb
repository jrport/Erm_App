class Admin::ContasController < ApplicationController
  def new
    @user = User.new
    render turbo_stream: turbo_stream.prepend('content', partial: 'admin/contas/modal', locals: { user: @user })
  end

  def create
    @user = User.new
    if check_password && check_email
      raise
      @user = User.new(user_params)
      if @user.save
        redirect_to configuracoes_path, notice: 'Usuário criado'
      else
        render turbo_stream: turbo_stream.replace('modal', partial: 'admin/contas/modal', locals: { user: @user })
      end
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'admin/contas/modal', locals: { user: @user })
    end
  end

  def edit_email
    @user = User.find(params[:conta_id])
    render turbo_stream: turbo_stream.prepend('content', partial: 'admin/contas/modal', locals: { user: @user })
  end

  def update_email
    @user = User.find(params[:conta_id])
    if check_email 
      if @user.update(email: reset_email[:email]) && check_email
        redirect_to configuracoes_path, notice: 'Email alterada com sucesso'
      else
        render turbo_stream: turbo_stream.replace('modal', partial: 'admin/contas/modal', locals: { user: @user })
      end
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'admin/contas/modal', locals: { user: @user })
    end
  end

  def edit_password
    @user = User.find(params[:conta_id])
    render turbo_stream: turbo_stream.prepend('content', partial: 'admin/contas/modal', locals: { user: @user })
  end

  def update_password
    @user = User.find(params[:conta_id])
    if check_password
      @user.password = reset_password[:password]
      @user.save
      redirect_to configuracoes_path, notice: 'Senha alterada com sucesso'
    else
      render turbo_stream: turbo_stream.replace('modal', partial: 'admin/contas/modal', locals: { user: @user })
    end
  end

  def destroy
    @user = User.find(params[:conta_id])
    @user.destroy!
    redirect_to configuracoes_path, notice: 'Conta deletada'
  end

  private

  def check_email
    filtered_params = params.require(:user).permit(:email)
    if filtered_params[:email].try(:empty?)
      @user.errors.add(:email, 'Email não pode ser vazio')
      false
    end
    unless User.find_by(email: filtered_params[:email]).nil?
      @user.errors.add(:email, 'Email já cadastrado')
      return false
    end
    true
  end

  def check_password
    filtered_params = params.require(:user).permit(:password, :password_confirmation)
    if filtered_params[:password].length < 6
      @user.errors.add(:password, 'A senha deve ter no mínimo 6 caracteres')
      false
    elsif filtered_params[:password] == filtered_params[:password_confirmation]
      true
    else
      @user.errors.add(:password, 'As senhas não conferem')
      false
    end
  end

  def reset_password
    params.require(:user).permit(:password, :password_confirmation)
  end

  def reset_email
    params.require(:user).permit(:email)
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
