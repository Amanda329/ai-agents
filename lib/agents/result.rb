# frozen_string_literal: true

module Agents
  RunResult = Struct.new(:output, :messages, :usage, :error, :context,
                         :awaiting_human_input, :human_prompt, keyword_init: true) do
    def success?
      error.nil? && !output.nil?
    end

    def failed?
      !success?
    end

    # True when the run paused to request input from a human. While paused,
    # +output+ is nil and +human_prompt+ holds the question to ask. Resume by
    # calling run(answer, context: result.context).
    def awaiting_human_input?
      !!awaiting_human_input
    end
  end
end
