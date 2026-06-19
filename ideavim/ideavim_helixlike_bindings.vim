""" Leader ------------------------
" Inspired by Space mode by https://docs.helix-editor.com/keymap.html#space-mode
let g:WhichKeyDesc_space="<leader> Space mode..."
nmap <leader>f <Action>(GotoFile)
let g:WhichKeyDesc_findFile="<leader>f open File picker"
nmap <leader>F :NERDTreeFind<cr>
let g:WhichKeyDesc_findFileFind="<leader>F Find current File in explorer"
nmap <leader>e :NERDTree<cr>
let g:WhichKeyDesc_findExplorer="<leader>e open file Explorer"
nmap <leader>b <Action>(RecentFiles)
let g:WhichKeyDesc_findBuffer="<leader>b open Buffer picker (recent files)"
nmap <leader>j <Action>(RecentLocations)
let g:WhichKeyDesc_findLocation="<leader>j open Jumplist picker (recent locations)"
nmap <leader>g <Action>(RecentChangedFiles)
let g:WhichKeyDesc_findChangedLocation="<leader>g open chanGed files picker"
nmap <leader>k <Action>(QuickImplementations)
let g:WhichKeyDesc_showQuickImplementation="<leader>k show quick implementation"
nmap <leader>s <Action>(FileStructurePopup)
let g:WhichKeyDesc_showGotoStructure="<leader>s open document Structure picker"
nmap <leader>S <Action>(GotoSymbol)
let g:WhichKeyDesc_showGotoSymbol="<leader>S open Symbol picker"
nmap <leader>d <Action>(ActivateProblemsViewToolWindow)
let g:WhichKeyDesc_showFileDiagnostics="<leader>d show file Diagnostics"
nmap <leader>D <Action>(ActivateProblemsViewToolWindow)
let g:WhichKeyDesc_showProjectDiagnostics="<leader>D show project Diagnostics"
nmap <leader>r <Action>(RenameElement)
let g:WhichKeyDesc_rename="<leader>r Rename element"
nmap <leader>a <Action>(ShowIntentionActions)
let g:WhichKeyDesc_showIntentionActions="<leader>a Apply code actions"
nmap <leader>h <Action>(ShowUsages)
let g:WhichKeyDesc_showReferences="<leader>h select references"
nmap <leader>w <C-w>
let g:WhichKeyDesc_toWindowMode="<leader>w go to Window mode"
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
let g:WhichKeyDesc_systemYank="<leader>y Yank to system clipboard"
"" I prefer leader R to go to the Refactor menu
"vmap <leader>R "+p
"let g:WhichKeyDesc_systemReplace="<leader>R Replace selection by system clipboard"
nmap <leader>/ <Action>(FindInPath)
let g:WhichKeyDesc_showFindInPath="<leader>/ global search (Find in path)"
nmap <leader>? <Action>(GotoAction)
let g:WhichKeyDesc_showGotoAction="<leader>? Open command palette"

nmap <leader>R <Action>(Refactorings.QuickListPopupAction)
vmap <leader>R <Action>(Refactorings.QuickListPopupAction)
let g:WhichKeyDesc_refactorMenu="<leader>R Refactor menu"

"   Run tests/debug
let g:WhichKeyDesc_debug="<leader>G Debug..."
nmap <leader>Gb <Action>(ToggleLineBreakpoint)
let g:WhichKeyDesc_debug_toggleLineBreakpoint="<leader>Gb toggle line Breakpoint"
nmap <leader>Gs <Action>(Stop)
let g:WhichKeyDesc_debug_stop="<leader>Gs Stop execution"
nmap <leader>Gd <Action>(DebugClass)
let g:WhichKeyDesc_debug_debug="<leader>Gd Debug class"
nmap <leader>Gt <Action>(RunClass)
let g:WhichKeyDesc_debug_runTest="<leader>Gt run Test"
nmap <leader>Gr <Action>(RerunFailedTests)
let g:WhichKeyDesc_debug_rerunFailedTest="<leader>Gr Rerun failed Tests"

"    VCS
let g:WhichKeyDesc_vsc="<leader>v VCS..."
nmap <leader>va <Action>(Annotate)
let g:WhichKeyDesc_showVscAnnotate="<leader>va Annotate"
nmap <leader>vc <Action>(VcsShowCurrentChangeMarker)
let g:WhichKeyDesc_showVscCurrentChange="<leader>vc show Current change"
nmap <leader>vf <Action>(Vcs.ShowTabbedFileHistory)
let g:WhichKeyDesc_undoVscFileHistory="<leader>vf current File history"
nmap <leader>vg <Action>(ActivateCommitToolWindow)
let g:WhichKeyDesc_showVscCommitWindow="<leader>vg commit change to Git"
nmap <leader>vl <Action>(Vcs.Show.Log)
let g:WhichKeyDesc_undoVscLog="<leader>vl Log"
nmap <leader>vu <Action>(Vcs.RollbackChangedLines)
let g:WhichKeyDesc_undoVscCurrentChange="<leader>vu Undo current change"

""" Goto ------------------------
" Inspired by Goto mode by https://docs.helix-editor.com/keymap.html#goto-mode
nmap gD <Action>(GotoSuperMethod)
let g:WhichKeyDesc_gotoDefinition="gD go to Definition"
nmap gd <Action>(GotoDeclaration)
let g:WhichKeyDesc_gotoDeclaration="gd go to Declaration"
nmap gy <Action>(QuickTypeDefinition)
let g:WhichKeyDesc_quickTypeDefinition="gy quick type definition"
nmap gi <Action>(GotoImplementation)
let g:WhichKeyDesc_gotoImplementation="gi go to Implementation"
nmap gr <Action>(ShowUsages)
let g:WhichKeyDesc_gotoReferences="gr go to References"
nmap gh 0
let g:WhichKeyDesc_gotoFirstCharInLine="gh go to first column (0)"
nmap gl $
let g:WhichKeyDesc_gotoLastCharInLine="gl go to Last character in line ($)"
nmap gs _
let g:WhichKeyDesc_gotoFirstNonWhitespace="gs go to Start of line (_)"
nmap gt H
let g:WhichKeyDesc_gotoTop="gt go to Top of file (H)"
nmap gc M
let g:WhichKeyDesc_gotoCentre="gc to Centre of file (M)"
nmap gb L
let g:WhichKeyDesc_gotoBottom="gb to Bottom of file (L)"
nmap g. `.
let g:WhichKeyDesc_gotoLastModificationCurrentFile="g. go to last modification (`.)"
nmap g; <Action>(JumpToLastChange)
let g:WhichKeyDesc_gotoPrevEditLocation="g; go to previous edit location"
nmap g, <Action>(JumpToNextChange)
let g:WhichKeyDesc_gotoNextEditLocation="g, go to next edit location"
nmap ga <C-^>
let g:WhichKeyDesc_gotoAlternateFile="ga go to Alternate file (<C-^>)"
nmap gw <Action>(AceAction)
xmap gw <Action>(AceAction)
let g:WhichKeyDesc_AceAction="gw jump to Word"

nmap gQ <Action>(ReformatCode)
vmap gQ <Action>(ReformatCode)
nmap = <Action>(ReformatCode)
vmap = <Action>(ReformatCode)
let g:WhichKeyDesc_reformatCode="gQ format whole file"
let g:WhichKeyDesc_reformatCodeEquals="= format whole file"

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

nmap [e <Action>(MoveLineUp)
vmap [e <Action>(MoveLineUp)
let g:WhichKeyDesc_moveLineUp="[e move line up"
nmap ]e <Action>(MoveLineDown)
vmap ]e <Action>(MoveLineDown)
let g:WhichKeyDesc_moveLineDown="]e move line down"
vmap [v <Action>(EditorUnSelectWord)
let g:WhichKeyDesc_unSelectWord="[v shrink Visual selection"
vmap ]v <Action>(EditorSelectWord)
let g:WhichKeyDesc_selectWord="]v grow Visual selection"
nmap [` <Action>(GotoPreviousBookmark)
let g:WhichKeyDesc_prev_bookmark="[` previous bookmark"
nmap ]` <Action>(GotoNextBookmark)
let g:WhichKeyDesc_next_bookmark="]` next bookmark"

nmap [b <Action>(PreviousTab)
let g:WhichKeyDesc_prevTab="[b goto previous tab (Buffer)"
nmap ]b <Action>(NextTab)
let g:WhichKeyDesc_nextTab="]b goto next tab (Buffer)"
nmap [B <Action>(GoToTab1)
let g:WhichKeyDesc_firstTab="[B goto first tab (Buffer)"
nmap ]B <Action>(GoToLastTab)
let g:WhichKeyDesc_lastTab="]B goto last tab (Buffer)"

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