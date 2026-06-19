""" Selection ------------------------
vmap <M-o> <Action>(EditorSelectWord)
let g:WhichKeyDesc_expandSelection="<M-o> expand selection Outward"
vmap <M-i> <Action>(EditorUnSelectWord)
let g:WhichKeyDesc_shrinkSelection="<M-i> shrink selection Inward"
vmap <M-;> o
let g:WhichKeyDesc_flipCursor="<M-;> flip cursor in selection"

""" Leader ------------------------
" Inspired by Space mode by https://docs.helix-editor.com/keymap.html#space-mode
let g:WhichKeyDesc_space="<leader> Space mode..."
nmap <leader>f <Action>(GotoFile)
let g:WhichKeyDesc_findFile="<leader>f open File picker"
"" Close enough...
nmap <leader>F :NERDTreeFind<cr>
let g:WhichKeyDesc_findFileFind="<leader>F Find current File in explorer"
"" Not listed as Helix doesn't really do file explorers, but in Jetbrains IDE's its useful sometimes
nmap <leader>e :NERDTree<cr>
let g:WhichKeyDesc_findExplorer="<leader>e open file Explorer"
nmap <leader>b <Action>(RecentFiles)
let g:WhichKeyDesc_findBuffer="<leader>b open Buffer picker (recent files)"
nmap <leader>j <Action>(RecentLocations)
let g:WhichKeyDesc_findLocation="<leader>j open Jumplist picker (recent locations)"
nmap <leader>g <Action>(RecentChangedFiles)
let g:WhichKeyDesc_findChangedLocation="<leader>g open chanGed files picker"
nmap <leader>k <Action>(QuickImplementations)
let g:WhichKeyDesc_showQuickImplementation="<leader>k show documentation popup"
nmap <leader>s <Action>(FileStructurePopup)
let g:WhichKeyDesc_showGotoStructure="<leader>s open document Structure picker"
nmap <leader>S <Action>(GotoSymbol)
let g:WhichKeyDesc_showGotoSymbol="<leader>S open Symbol picker"
"" Jetbrains has no different window for file (leader-d) or project (leader-D) diagnostics
nmap <leader>d <Action>(ActivateProblemsViewToolWindow)
nmap <leader>D <Action>(ActivateProblemsViewToolWindow)
let g:WhichKeyDesc_showFileDiagnostics="<leader>d show Diagnostics"
let g:WhichKeyDesc_showProjectDiagnostics="<leader>D"
nmap <leader>r <Action>(RenameElement)
let g:WhichKeyDesc_rename="<leader>r Rename element"
nmap <leader>a <Action>(ShowIntentionActions)
let g:WhichKeyDesc_showIntentionActions="<leader>a Apply code actions"
nmap <leader>h <Action>(ShowUsages)
let g:WhichKeyDesc_showReferences="<leader>h select references"
nmap <leader>w <C-w>
let g:WhichKeyDesc_toWindowMode="<leader>w go to Window mode"
"" There is no real "smart comment", so default to line comments
nmap <leader>c <Action>(CommentByLineComment)
vmap <leader>c <Action>(CommentByLineComment)
let g:WhichKeyDesc_toggleComments="<leader>c toggle Comments"
nmap <leader>C <Action>(CommentByBlockComment)
vmap <leader>C <Action>(CommentByBlockComment)
let g:WhichKeyDesc_toggleBlockComments="<leader>C toggle block Comments"
nmap <leader><A-c> <Action>(CommentByLineComment)
vmap <leader><A-c> <Action>(CommentByLineComment)
let g:WhichKeyDesc_toggleLineComments="<leader><A-c> toggle line Comments"
nmap <leader>p "+p
vmap <leader>p "+p
let g:WhichKeyDesc_systemPaste="<leader>p Paste from system clipboard (after)"
nmap <leader>P "+P
vmap <leader>P "+P
let g:WhichKeyDesc_systemPasteBefore="<leader>P Paste from system clipboard (before)"
nmap <leader>y "+y
vmap <leader>y "+y
let g:WhichKeyDesc_systemYankSelection="<leader>y Yank to system clipboard"
"" Yank main selection is not a thing in vim, simply remap this to regular yank
nmap <leader>Y "+y
vmap <leader>Y "+y
let g:WhichKeyDesc_systemYankMainSelection="<leader>Y"
"" Behaves the same as "+p, makes sense in Helix, less so in Vim when the more straight forward
"" way of doing this is to make a selection and use paste.
"vmap <leader>R "+p
"let g:WhichKeyDesc_systemReplace="<leader>R Replace selection by system clipboard"
nmap <leader>/ <Action>(FindInPath)
let g:WhichKeyDesc_showFindInPath="<leader>/ global search (Find in path)"
nmap <leader>? <Action>(GotoAction)
let g:WhichKeyDesc_showGotoAction="<leader>? Open command palette"

""" Goto ------------------------
" Inspired by Goto mode by https://docs.helix-editor.com/keymap.html#goto-mode
nmap ge G
let g:WhichKeyDesc_gotoEnd="ge go to End of file (G)"
nmap gh 0
let g:WhichKeyDesc_gotoFirstCharInLine="gh go to first column (0)"
nmap gl $
let g:WhichKeyDesc_gotoLastCharInLine="gl go to Last character in line ($)"
nmap gs _
let g:WhichKeyDesc_gotoFirstNonWhitespace="gs go to Start of line (_)"
nmap gt H
let g:WhichKeyDesc_gotoTop="gt go to Top of screen (H)"
nmap gc M
let g:WhichKeyDesc_gotoCentre="gc to Centre of screen (M)"
nmap gb L
let g:WhichKeyDesc_gotoBottom="gb to Bottom of screen (L)"
" gd already has default binding
let g:WhichKeyDesc_quickTypeDefinition="gd go to Definition"
nmap gy <Action>(QuickTypeDefinition)
let g:WhichKeyDesc_quickTypeDefinition="gy quick type definition"
nmap gr <Action>(ShowUsages)
let g:WhichKeyDesc_gotoReferences="gr go to References"
nmap gi <Action>(GotoImplementation)
let g:WhichKeyDesc_gotoImplementation="gi go to Implementation"
nmap ga <C-^>
let g:WhichKeyDesc_gotoAlternateFile="ga go to Alternate file (<C-^>)"
nmap gm <C-^>
let g:WhichKeyDesc_gotoAlternateModifiedFile="gm go to alternate Modified file"
nmap gn <Action>(NextTab)
let g:WhichKeyDesc_gotoAlternateModifiedFile="gn Next buffer"
nmap gp <Action>(PreviousTab)
let g:WhichKeyDesc_gotoAlternateModifiedFile="gp Previous buffer"
nmap g. `.
let g:WhichKeyDesc_gotoLastModificationCurrentFile="g. go to last modification (`.)"
nmap gw <Action>(AceAction)
xmap gw <Action>(AceAction)
let g:WhichKeyDesc_AceAction="gw jump to Word"

""" Next / Previous --------------------------
" Inspired by unimpaired mappings by https://docs.helix-editor.com/keymap.html#unimpaired
nmap ]d <Action>(GotoNextError)
let g:WhichKeyDesc_goToNextDiagnostic="]d go to next Diagnostic"
nmap [d <Action>(GotoPreviousError)
let g:WhichKeyDesc_goToPrevDiagnostic="[d go to previous Diagnostic"
nmap [D gg<Action>(GotoNextError)
let g:WhichKeyDesc_goToFirstDiagnostic="[D go to first Diagnostic"
nmap ]D G<Action>(GotoPreviousError)
let g:WhichKeyDesc_goToLastDiagnostic="]D go to last Diagnostic"
"" Next/Prev function? Use native vim Next/Prev method binding instead
" nmap ]f ]m
" nmap [f [m
"" Next/Prev class (type)? In all our projects, having multiple classes in one file is a big no-no
" so simply don't bind this one.
" nmap ]t ?
" nmap [t ?
"" Next/Prev argument has no implementation, sorry
" nmap ]a ?
" nmap [a ?
"" Next/Prev comment has no implementation, sorry
" nmap ]c ?
" nmap [c ?
"" Next/Prev test? Next/Pref method is probably the closest
" nmap ]T ]m
" nmap [T [m
nmap ]p }
let g:WhichKeyDesc_prevParagraph="]p previous Paragraph (})"
nmap [p {
let g:WhichKeyDesc_nextParagraph="[p next Paragraph ({)"
nmap [g <Action>(VcsShowPrevChangeMarker)
let g:WhichKeyDesc_prevChange="[g previous change (Git)"
nmap ]g <Action>(VcsShowNextChangeMarker)
let g:WhichKeyDesc_nextChange="]g next change (Git)"
nmap [G gg<Action>(VcsShowNextChangeMarker)
let g:WhichKeyDesc_firstChange="[G first change (Git)"
nmap ]G G<Action>(VcsShowPrevChangeMarker)
let g:WhichKeyDesc_lastChange="]G last change (Git)"
nmap [<Space> <Action>(EditorStartNewLineBefore)
let g:WhichKeyDesc_startNewLineBefore="[<Space> add newline above"
nmap ]<Space> <Action>(EditorStartNewLine)
let g:WhichKeyDesc_startNewLine="]<Space> add newline below"

" window -------------------------------
nmap <C-w>d <Action>(ShowErrorDescription)
nmap <C-w><C-d> <Action>(ShowErrorDescription)
let g:WhichKeyDesc_showDiagnosticDesc="<C-w>d show Diagnostic description"
let g:WhichKeyDesc_showDiagnosticDescCtr="<C-w><C-d>"
nmap <C-w>x <Action>(MoveEditorToOppositeTabGroup)
let g:WhichKeyDesc_moveTabToOppositeGroup="<C-w>x eXchange split"
nmap <C-w>q <Action>(CloseAllEditors)
let g:WhichKeyDesc_closeAllBuffersInSplit="<C-w>q Quit all buffers in split"
nmap <C-w>n <Action>(EditSourceInNewWindow)
let g:WhichKeyDesc_editSourceInNewWindow="<C-w>n open New window"
nmap <leader>W <Action>(HideAllWindows)
let g:WhichKeyDesc_hideAllWindows="<leader>W hide all Windows"
