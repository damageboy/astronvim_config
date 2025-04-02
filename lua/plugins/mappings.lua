-- ---
-- Intro
-- ---

-- comprehensive mapping file containing comments describing each of the
-- mappings found in a standard NeoVim configuration so it's easy to see
-- what keys make the most sense for remapping and how the remapping may
-- relate functionally or mnemonically to the original key.

local function enhance_maps(maps)

  local core = require "astrocore"
  local ui = require "astroui"

  -- notify "user.mappings executed"
  -- Chat/AI Menu

  maps.n["<Leader>a"] =
    { "<Leader> a", desc = ui.get_icon("DiagnosticHint", 1, true) .. "Chat/AI Menu" }

  -- CopilotChat Commands (primary AI interface)
  maps.n["<Leader>ac"] = { "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat Toggle" }
  maps.n["<Leader>af"] = { "<cmd>CopilotChatFix<cr>", desc = "Fix Code" }
  maps.n["<Leader>ae"] = { "<cmd>CopilotChatExplain<cr>", desc = "Explain Code" }
  maps.n["<Leader>at"] = { "<cmd>CopilotChatTests<cr>", desc = "Generate Tests" }
  maps.n["<Leader>ao"] = { "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code" }
  maps.n["<Leader>ad"] = { "<cmd>CopilotChatDocs<cr>", desc = "Document Code" }
  maps.n["<Leader>am"] = { "<cmd>CopilotChatCommit<cr>", desc = "Generate Commit" }
  maps.n["<Leader>ar"] = { "<cmd>CopilotChatReset<cr>", desc = "Reset Chat" }
  maps.n["<Leader>as"] = { "<cmd>CopilotChatSave<cr>", desc = "Save Chat" }
  maps.n["<Leader>al"] = { "<cmd>CopilotChatLoad<cr>", desc = "Load Chat" }

  -- Visual mode mappings for CopilotChat
  maps.v["<Leader>a"] = { "<Leader>c", desc = ui.get_icon("DiagnosticHint", 1, true) .. "Chat/AI Menu" }
  maps.v["<Leader>af"] = { "<cmd>CopilotChatFix<cr>", desc = "Fix Code" }
  maps.v["<Leader>ae"] = { "<cmd>CopilotChatExplain<cr>", desc = "Explain Code" }
  maps.v["<Leader>at"] = { "<cmd>CopilotChatTests<cr>", desc = "Generate Tests" }
  maps.v["<Leader>ao"] = { "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code" }
  maps.v["<Leader>ad"] = { "<cmd>CopilotChatDocs<cr>", desc = "Document Code" }
  return maps
end

-- ---
-- Outro
-- ---

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.mappings = enhance_maps(opts.mappings)
    end
  }
}
