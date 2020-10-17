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
        when "sin_credito"
          user.update(point: user.point += 40)
        when "automoviles"
          user.update(point: user.point += 20)
        when "dirigidas"
          user.update(point: user.point += 20)
        when "no_clientes"
          user.update(point: user.point += 10)
        when "puntos"
          user.update(point: user.point += 5)
        when "comercial"
          user.update(point: user.point += 5)
      end
    end
  end
end
