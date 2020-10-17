class UsersToOffer < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  after_update :adding_points_to_user

  private

  def adding_points_to_user
    if used == true
      case offer.category
      when "con_credito"
        user.update(point: user.point += 50)
        change_category
      when "sin_credito"
        user.update(point: user.point += 40)
        change_category
      when "automoviles"
        user.update(point: user.point += 20)
        change_category
      when "dirigidas"
        user.update(point: user.point += 20)
        change_category
      when "no_clientes"
        user.update(point: user.point += 10)
        change_category
      when "puntos"
        user.update(point: user.point += 5)
        change_category
      when "comercial"
        user.update(point: user.point += 5)
        change_category
      end
    end
  end

  def change_category
    if user.point >= 20 && user.point < 50
      user.update(category: 1)
    elsif user.point >= 50
      user.update(category: 2)
    else
      user.update(category: 0)
    end
  end
end
