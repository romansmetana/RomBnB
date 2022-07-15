module ReservationsHelper
  def room_count(room_id)
    current_room = Room.find_by(id: room_id)

    if session[:reservation_id]
      current_room.count -= 1
    else
      current_room.count += 1
    end
    current_room.save
  end
end
