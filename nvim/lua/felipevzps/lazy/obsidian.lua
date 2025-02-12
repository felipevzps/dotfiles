return {
    "epwalsh/obsidian.nvim",

    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",

    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "workspace",
                    path = "~/obsidian/workspace/",
                },
            },

            ui = {
                enable = false, -- disable all additional syntax feature
            },

            disable_frontmatter = true, -- 'true' to disable obsidian.nvim frontmatter

            notes_subdir = "workspace/inbox",

            new_notes_location = "notes_subdir",

            --wiki_link_func = "use_alias_only",

            --markdown_link_func = "use_alias_only",
            
            templates = {
                folder = "workspace/templates",
                date_format = "%Y-%m-%d-%a",
                time_format = "%H:%M",
                substitutions = {
                    -- calculate relative week of the month
                    week_number = function()
                        local current_date = os.date("*t")
                        local first_day = os.date("*t", os.time{year = current_date.year, month = current_date.month, day = 1})
                        local first_weekday = first_day.wday
                        local days_until_first_week = (8 - first_weekday) % 7
                        local days_since_start = current_date.day - 1
                        local week_number = math.floor((days_since_start + days_until_first_week) / 7) + 1
                        return tostring(week_number)
                    end,
                    -- get month name
                    month_name = function()
                        local current_date = os.date("*t")
                        local month_names = {
                            "January", "February", "March", "April", "May", "June",
                            "July", "August", "September", "October", "November", "December"
                        }
                        return month_names[current_date.month]
                    end,
                    -- get current year
                    year = function()
                        local current_date = os.date("*t")
                        return tostring(current_date.year)
                    end,
                    -- get day number of the current month
                    monday_date = function() return get_weekday_date(0) end,
                    tuesday_date = function() return get_weekday_date(1) end,
                    wednesday_date = function() return get_weekday_date(2) end,
                    thursday_date = function() return get_weekday_date(3) end,
                    friday_date = function() return get_weekday_date(4) end,
                    saturday_date = function() return get_weekday_date(5) end,
                    sunday_date = function() return get_weekday_date(6) end,
                },
            },
            -- customize how note IDs are generated given an optional title
            note_id_func = function(title)
                if title ~= nil then
                    -- if title is given, transform it into a valid file name
                    return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- if title is nil, just add 4 random uppercase letters to the suffix
                    local suffix = ""
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                    return suffix
                end
            end,

            -- customize how note file names are generated given the ID, target directory, and title
            note_path_func = function(spec)
                local path = spec.dir / tostring(spec.id)
                return path:with_suffix(".md")
            end,
        })

        -- format day of the month (format %d/%m)
        function get_weekday_date(offset)
            local current_date = os.date("*t")
            local start_day = current_date.day - (current_date.wday - 2) -- Segunda-feira é o início da semana
            if start_day < 1 then
                start_day = start_day + os.date("*t", os.time{year = current_date.year, month = current_date.month, day = 0}).day
            end
            return os.date("%d/%m", os.time{year = current_date.year, month = current_date.month, day = start_day + offset}) -- default date (%Y-%m-%d)
        end

        -- create file using template
        vim.api.nvim_set_keymap("n", "<leader>temp", [[:ObsidianNewFromTemplate <CR>]], { noremap = true, silent = true })

        -- generate new note from link
        vim.api.nvim_set_keymap("v", "<leader>ll", [[:ObsidianLinkNew<CR>]], { noremap = true, silent = true })
    end
}
