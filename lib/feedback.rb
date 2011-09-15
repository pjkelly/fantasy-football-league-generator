class Feedback
  def initialize(done_message = "Done.")
    @done_message = done_message
  end

  def provide(msg, &block)
    say(msg)
    yield
    say(@done_message)
  end

  protected

  def say(msg)
    puts [prefix, msg].join(" ")
  end

  def prefix
    "==>"
  end
end