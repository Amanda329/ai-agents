# frozen_string_literal: true

module Agents
  # Built-in tool an agent can call to request input from a human during a run.
  class HumanInputTool < Tool
    # Wire name the LLM uses to invoke this tool.
    TOOL_NAME = "request_human_input"

    description "Pause the conversation and request input from a human when you need information " \
                "that only a human can provide. The run suspends until an answer is supplied."
    param :prompt, type: "string", desc: "The question to put to the human."

    # Override the auto-generated name with the stable wire name.
    def name
      TOOL_NAME
    end

    def perform(tool_context, prompt:)
      raise NotImplementedError
    end
  end
end
