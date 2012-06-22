import qualified Data.Map as M

import XMonad
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar defaultConfig
        { modMask = mod4Mask
        , normalBorderColor = "#000000"
        , terminal = "sakura"
        , keys = keyMap
        }

keyMap x = M.union (keys defaultConfig x) (M.fromList (myKeys x))

myKeys conf@(XConfig {XMonad.modMask = modMask}) =
     [ ((modMask, xK_x), xmonadPrompt defaultXPConfig)
     , ((modMask, xK_z), shellPrompt defaultXPConfig)
     , ((modMask, xK_Tab), goToSelected defaultGSConfig)
     ]
