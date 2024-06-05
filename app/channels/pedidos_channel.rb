class PedidosChannel < ApplicationCable::Channel
  def subscribed
    stream_from "pedidos_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive
    ActionCable.server.broadcast('pedidos_channel', data)
  end
end
