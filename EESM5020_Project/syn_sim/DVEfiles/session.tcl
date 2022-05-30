# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Mon May 2 23:56:06 2022
# Designs open: 1
#   Sim: /afs/ee.ust.hk/staff/ee/cmfanab/vlsi_project/assignment1/syn_sim/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: fir_tb.uut.multiplication_2_reg_1_
#   Group count = 3
#   Group Group1 signal count = 814
#   Group Group2 signal count = 10
#   Group Group3 signal count = 34
# End_DVE_Session_Save_Info

# DVE version: Q-2020.03-SP1-1_Full64
# DVE build date: Jul 19 2020 21:06:08


#<Session mode="Full" path="/afs/ee.ust.hk/staff/ee/cmfanab/vlsi_project/assignment1/syn_sim/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{8 31} {1462 822}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 277]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 277
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 276} {height 524} {dock_state left} {dock_on_new_line true} {child_hier_colhier 169} {child_hier_coltype 107} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 427]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 427
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 524
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 426} {height 524} {dock_state left} {dock_on_new_line true} {child_data_colvariable 189} {child_data_colvalue 149} {child_data_coltype 89} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 169]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 400
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 169
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 399} {height 168} {dock_state bottom} {dock_on_new_line true}}
set Watch.1 [gui_create_window -type Watch -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line false -dock_extent 100]
gui_set_window_pref_key -window ${Watch.1} -key dock_width -value_type integer -value 200
gui_set_window_pref_key -window ${Watch.1} -key dock_height -value_type integer -value 100
gui_set_window_pref_key -window ${Watch.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Watch.1} {{left 0} {top 0} {width 1054} {height 168} {dock_state bottom} {dock_on_new_line false}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{}}
gui_set_env SIMSETUP::SIMEXE {./simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/afs/ee.ust.hk/staff/ee/cmfanab/vlsi_project/assignment1/syn_sim/simv}] } {
gui_sim_run Ucli -exe simv -args { -ucligui} -dir /afs/ee.ust.hk/staff/ee/cmfanab/vlsi_project/assignment1/syn_sim -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {fir_tb}
gui_load_child_values {fir_tb.uut}


set _session_group_1 Group1
gui_sg_create "$_session_group_1"
set Group1 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { fir_tb.i fir_tb.data_out fir_tb.complete fir_tb.clk fir_tb.rst_n fir_tb.data_in fir_tb.enable fir_tb.tap fir_tb.CLK_PERIOD fir_tb.uut.tap fir_tb.uut.data_in fir_tb.uut.data_out fir_tb.uut.clk fir_tb.uut.rst_n fir_tb.uut.enable fir_tb.uut.complete fir_tb.uut.mul_stage fir_tb.uut.add_stage1 fir_tb.uut.add_stage2 fir_tb.uut.N506 fir_tb.uut.N507 fir_tb.uut.N508 fir_tb.uut.N509 fir_tb.uut.N510 fir_tb.uut.N511 fir_tb.uut.N512 fir_tb.uut.N513 fir_tb.uut.N514 fir_tb.uut.N515 fir_tb.uut.N516 fir_tb.uut.N517 fir_tb.uut.N518 fir_tb.uut.N519 fir_tb.uut.N520 fir_tb.uut.N521 fir_tb.uut.N530 fir_tb.uut.N531 fir_tb.uut.N532 fir_tb.uut.N533 fir_tb.uut.N534 fir_tb.uut.N535 fir_tb.uut.N536 fir_tb.uut.N537 fir_tb.uut.N538 fir_tb.uut.N539 fir_tb.uut.N540 fir_tb.uut.N541 fir_tb.uut.N542 fir_tb.uut.N543 fir_tb.uut.N544 fir_tb.uut.N545 fir_tb.uut.N547 fir_tb.uut.N548 fir_tb.uut.N549 fir_tb.uut.N550 fir_tb.uut.N551 fir_tb.uut.N552 fir_tb.uut.N553 fir_tb.uut.N554 fir_tb.uut.N555 fir_tb.uut.N556 fir_tb.uut.N557 fir_tb.uut.N558 fir_tb.uut.N559 fir_tb.uut.N560 fir_tb.uut.N561 fir_tb.uut.N562 fir_tb.uut.N619 fir_tb.uut.N620 fir_tb.uut.N621 fir_tb.uut.N622 fir_tb.uut.N623 fir_tb.uut.N624 fir_tb.uut.N625 fir_tb.uut.N626 fir_tb.uut.N627 fir_tb.uut.N628 fir_tb.uut.N629 fir_tb.uut.N630 fir_tb.uut.N631 fir_tb.uut.N632 fir_tb.uut.N633 fir_tb.uut.N634 fir_tb.uut.N635 fir_tb.uut.N706 fir_tb.uut.N707 fir_tb.uut.N708 fir_tb.uut.N709 fir_tb.uut.N710 fir_tb.uut.N711 fir_tb.uut.N712 fir_tb.uut.N713 fir_tb.uut.N714 fir_tb.uut.N715 fir_tb.uut.N716 fir_tb.uut.N717 fir_tb.uut.N718 fir_tb.uut.N719 fir_tb.uut.N720 fir_tb.uut.N721 fir_tb.uut.N722 fir_tb.uut.N746 fir_tb.uut.N747 fir_tb.uut.N748 fir_tb.uut.N749 fir_tb.uut.N750 fir_tb.uut.N751 fir_tb.uut.N752 fir_tb.uut.N753 fir_tb.uut.N754 fir_tb.uut.N755 fir_tb.uut.N756 fir_tb.uut.N757 fir_tb.uut.N758 fir_tb.uut.N759 fir_tb.uut.N760 fir_tb.uut.N761 fir_tb.uut.N762 fir_tb.uut.N783 fir_tb.uut.N784 fir_tb.uut.N785 fir_tb.uut.N786 fir_tb.uut.N787 fir_tb.uut.N788 fir_tb.uut.N789 fir_tb.uut.N790 fir_tb.uut.N791 fir_tb.uut.N792 fir_tb.uut.N793 fir_tb.uut.N794 fir_tb.uut.N795 fir_tb.uut.N796 fir_tb.uut.N797 fir_tb.uut.N798 fir_tb.uut.N799 fir_tb.uut.N800 fir_tb.uut.N895 fir_tb.uut.N896 fir_tb.uut.N897 fir_tb.uut.N898 fir_tb.uut.N899 fir_tb.uut.N900 fir_tb.uut.N901 fir_tb.uut.N902 fir_tb.uut.N903 fir_tb.uut.N904 fir_tb.uut.N905 fir_tb.uut.N906 fir_tb.uut.N907 fir_tb.uut.N908 fir_tb.uut.N909 fir_tb.uut.N910 fir_tb.uut.N911 fir_tb.uut.N912 fir_tb.uut.n171 fir_tb.uut.n172 fir_tb.uut.n173 fir_tb.uut.n174 fir_tb.uut.n175 fir_tb.uut.n176 fir_tb.uut.n177 fir_tb.uut.n178 fir_tb.uut.n179 fir_tb.uut.n180 fir_tb.uut.n181 fir_tb.uut.n182 fir_tb.uut.n183 fir_tb.uut.n184 fir_tb.uut.n185 fir_tb.uut.n186 fir_tb.uut.n187 fir_tb.uut.n188 fir_tb.uut.n189 fir_tb.uut.n190 fir_tb.uut.n191 fir_tb.uut.n192 fir_tb.uut.n193 fir_tb.uut.n194 fir_tb.uut.n195 fir_tb.uut.n196 fir_tb.uut.n197 fir_tb.uut.n198 fir_tb.uut.n199 fir_tb.uut.n200 fir_tb.uut.n201 fir_tb.uut.n202 fir_tb.uut.n203 fir_tb.uut.n204 fir_tb.uut.n205 fir_tb.uut.n206 fir_tb.uut.n207 fir_tb.uut.n208 fir_tb.uut.n209 fir_tb.uut.n210 fir_tb.uut.n211 fir_tb.uut.n212 fir_tb.uut.n213 fir_tb.uut.n214 fir_tb.uut.n215 fir_tb.uut.n216 fir_tb.uut.n217 fir_tb.uut.n218 fir_tb.uut.n219 fir_tb.uut.n220 fir_tb.uut.n221 fir_tb.uut.n222 fir_tb.uut.n223 fir_tb.uut.n224 fir_tb.uut.n225 fir_tb.uut.n226 fir_tb.uut.n227 fir_tb.uut.n228 fir_tb.uut.n229 fir_tb.uut.n230 fir_tb.uut.n231 fir_tb.uut.n232 fir_tb.uut.n233 fir_tb.uut.n234 fir_tb.uut.n235 fir_tb.uut.n236 fir_tb.uut.n237 fir_tb.uut.n238 fir_tb.uut.n239 fir_tb.uut.n240 fir_tb.uut.n241 fir_tb.uut.n242 fir_tb.uut.n243 fir_tb.uut.n244 fir_tb.uut.n245 fir_tb.uut.n246 fir_tb.uut.n247 fir_tb.uut.n248 fir_tb.uut.n249 fir_tb.uut.n250 fir_tb.uut.n251 fir_tb.uut.n252 fir_tb.uut.n253 fir_tb.uut.n254 fir_tb.uut.n255 fir_tb.uut.n256 fir_tb.uut.n257 fir_tb.uut.n258 fir_tb.uut.n259 fir_tb.uut.n260 fir_tb.uut.n261 fir_tb.uut.n262 fir_tb.uut.n263 fir_tb.uut.n264 fir_tb.uut.n265 fir_tb.uut.n266 fir_tb.uut.n267 fir_tb.uut.n268 }
gui_sg_addsignal -group "$_session_group_1" { fir_tb.uut.n279 fir_tb.uut.n280 fir_tb.uut.n281 fir_tb.uut.n282 fir_tb.uut.n283 fir_tb.uut.n284 fir_tb.uut.n285 fir_tb.uut.n286 fir_tb.uut.n287 fir_tb.uut.n288 fir_tb.uut.n289 fir_tb.uut.n290 fir_tb.uut.n291 fir_tb.uut.n292 fir_tb.uut.n293 fir_tb.uut.n294 fir_tb.uut.n295 fir_tb.uut.n296 fir_tb.uut.n297 fir_tb.uut.n298 fir_tb.uut.n299 fir_tb.uut.n300 fir_tb.uut.n301 fir_tb.uut.n302 fir_tb.uut.n303 fir_tb.uut.n304 fir_tb.uut.n305 fir_tb.uut.n306 fir_tb.uut.n307 fir_tb.uut.n308 fir_tb.uut.n309 fir_tb.uut.n310 fir_tb.uut.n311 fir_tb.uut.n312 fir_tb.uut.n313 fir_tb.uut.n314 fir_tb.uut.n315 fir_tb.uut.n316 fir_tb.uut.n317 fir_tb.uut.n318 fir_tb.uut.n319 fir_tb.uut.n320 fir_tb.uut.n323 fir_tb.uut.n324 fir_tb.uut.n325 fir_tb.uut.n326 fir_tb.uut.n327 fir_tb.uut.n328 fir_tb.uut.n329 fir_tb.uut.n330 fir_tb.uut.n331 fir_tb.uut.n332 fir_tb.uut.n333 fir_tb.uut.n334 fir_tb.uut.n335 fir_tb.uut.n336 fir_tb.uut.n337 fir_tb.uut.n338 fir_tb.uut.n339 fir_tb.uut.n340 fir_tb.uut.n341 fir_tb.uut.n342 fir_tb.uut.n343 fir_tb.uut.n344 fir_tb.uut.n345 fir_tb.uut.n346 fir_tb.uut.n347 fir_tb.uut.n348 fir_tb.uut.n349 fir_tb.uut.n350 fir_tb.uut.n351 fir_tb.uut.n352 fir_tb.uut.n353 fir_tb.uut.n354 fir_tb.uut.n355 fir_tb.uut.n356 fir_tb.uut.n357 fir_tb.uut.n358 fir_tb.uut.n359 fir_tb.uut.n360 fir_tb.uut.n361 fir_tb.uut.n362 fir_tb.uut.n363 fir_tb.uut.n364 fir_tb.uut.n365 fir_tb.uut.n366 fir_tb.uut.n367 fir_tb.uut.n368 fir_tb.uut.n369 fir_tb.uut.n370 fir_tb.uut.n371 fir_tb.uut.n372 fir_tb.uut.n373 fir_tb.uut.n374 fir_tb.uut.n375 fir_tb.uut.n376 fir_tb.uut.n377 fir_tb.uut.n378 fir_tb.uut.n379 fir_tb.uut.n380 fir_tb.uut.n381 fir_tb.uut.n382 fir_tb.uut.n384 fir_tb.uut.n385 fir_tb.uut.n386 fir_tb.uut.n387 fir_tb.uut.n388 fir_tb.uut.n389 fir_tb.uut.n390 fir_tb.uut.n391 fir_tb.uut.n392 fir_tb.uut.n393 fir_tb.uut.n394 fir_tb.uut.n395 fir_tb.uut.n396 fir_tb.uut.n397 fir_tb.uut.n398 fir_tb.uut.n399 fir_tb.uut.n400 fir_tb.uut.n401 fir_tb.uut.n402 fir_tb.uut.n403 fir_tb.uut.n404 fir_tb.uut.n405 fir_tb.uut.n406 fir_tb.uut.n407 fir_tb.uut.n408 fir_tb.uut.n409 fir_tb.uut.n410 fir_tb.uut.n411 fir_tb.uut.n412 fir_tb.uut.n413 fir_tb.uut.n414 fir_tb.uut.n415 fir_tb.uut.n416 fir_tb.uut.n417 fir_tb.uut.n418 fir_tb.uut.n419 fir_tb.uut.n420 fir_tb.uut.n421 fir_tb.uut.n422 fir_tb.uut.n423 fir_tb.uut.n424 fir_tb.uut.n425 fir_tb.uut.n426 fir_tb.uut.n427 fir_tb.uut.n428 fir_tb.uut.n429 fir_tb.uut.n430 fir_tb.uut.n431 fir_tb.uut.n432 fir_tb.uut.n433 fir_tb.uut.n434 fir_tb.uut.n435 fir_tb.uut.n436 fir_tb.uut.n437 fir_tb.uut.n438 fir_tb.uut.n439 fir_tb.uut.n440 fir_tb.uut.n441 fir_tb.uut.n442 fir_tb.uut.n443 fir_tb.uut.n444 fir_tb.uut.n445 fir_tb.uut.n446 fir_tb.uut.n447 fir_tb.uut.n448 fir_tb.uut.n449 fir_tb.uut.n450 fir_tb.uut.n451 fir_tb.uut.n452 fir_tb.uut.n453 fir_tb.uut.n454 fir_tb.uut.n455 fir_tb.uut.n456 fir_tb.uut.n457 fir_tb.uut.n458 fir_tb.uut.n459 fir_tb.uut.n460 fir_tb.uut.n461 fir_tb.uut.n462 fir_tb.uut.n463 fir_tb.uut.n464 fir_tb.uut.n465 fir_tb.uut.n466 fir_tb.uut.n467 fir_tb.uut.n468 fir_tb.uut.n469 fir_tb.uut.n470 fir_tb.uut.n471 fir_tb.uut.n472 fir_tb.uut.n473 fir_tb.uut.n474 fir_tb.uut.n475 fir_tb.uut.n476 fir_tb.uut.n477 fir_tb.uut.n478 fir_tb.uut.n479 fir_tb.uut.n480 fir_tb.uut.n482 fir_tb.uut.n483 fir_tb.uut.n484 fir_tb.uut.n485 fir_tb.uut.n486 fir_tb.uut.n487 fir_tb.uut.n488 fir_tb.uut.n489 fir_tb.uut.n490 fir_tb.uut.n491 fir_tb.uut.n492 fir_tb.uut.n493 fir_tb.uut.n494 fir_tb.uut.n495 fir_tb.uut.n496 fir_tb.uut.n497 fir_tb.uut.n498 fir_tb.uut.n499 fir_tb.uut.n500 fir_tb.uut.n501 fir_tb.uut.n502 fir_tb.uut.n503 fir_tb.uut.n504 fir_tb.uut.n505 fir_tb.uut.n506 fir_tb.uut.n507 fir_tb.uut.n508 fir_tb.uut.n509 fir_tb.uut.n510 fir_tb.uut.n511 fir_tb.uut.n512 fir_tb.uut.n513 fir_tb.uut.n514 fir_tb.uut.n515 fir_tb.uut.n516 fir_tb.uut.n517 fir_tb.uut.n518 fir_tb.uut.n519 fir_tb.uut.n520 fir_tb.uut.n521 fir_tb.uut.n522 fir_tb.uut.n523 fir_tb.uut.n524 fir_tb.uut.n525 fir_tb.uut.n526 fir_tb.uut.n527 fir_tb.uut.n528 fir_tb.uut.n529 fir_tb.uut.n530 fir_tb.uut.n531 fir_tb.uut.n532 fir_tb.uut.n533 fir_tb.uut.n534 fir_tb.uut.n535 }
gui_sg_addsignal -group "$_session_group_1" { fir_tb.uut.n536 fir_tb.uut.n537 fir_tb.uut.n538 fir_tb.uut.n539 fir_tb.uut.n540 fir_tb.uut.n541 fir_tb.uut.n542 fir_tb.uut.n543 fir_tb.uut.n544 fir_tb.uut.n545 fir_tb.uut.n546 fir_tb.uut.n547 fir_tb.uut.n548 fir_tb.uut.n549 fir_tb.uut.n550 fir_tb.uut.n551 fir_tb.uut.n552 fir_tb.uut.n553 fir_tb.uut.n554 fir_tb.uut.n555 fir_tb.uut.n556 fir_tb.uut.n557 fir_tb.uut.n558 fir_tb.uut.n559 fir_tb.uut.n560 fir_tb.uut.n561 fir_tb.uut.n562 fir_tb.uut.n563 fir_tb.uut.n564 fir_tb.uut.n565 fir_tb.uut.n566 fir_tb.uut.n567 fir_tb.uut.n568 fir_tb.uut.n569 fir_tb.uut.n570 fir_tb.uut.n571 fir_tb.uut.n572 fir_tb.uut.n573 fir_tb.uut.n574 fir_tb.uut.n575 fir_tb.uut.n576 fir_tb.uut.n577 fir_tb.uut.n578 fir_tb.uut.n579 fir_tb.uut.n580 fir_tb.uut.n581 fir_tb.uut.n582 fir_tb.uut.n583 fir_tb.uut.n584 fir_tb.uut.n585 fir_tb.uut.n586 fir_tb.uut.n587 fir_tb.uut.n588 fir_tb.uut.n589 fir_tb.uut.n590 fir_tb.uut.n591 fir_tb.uut.n592 fir_tb.uut.n593 fir_tb.uut.n594 fir_tb.uut.n595 fir_tb.uut.n596 fir_tb.uut.n597 fir_tb.uut.n598 fir_tb.uut.n599 fir_tb.uut.n600 fir_tb.uut.n601 fir_tb.uut.n602 fir_tb.uut.n603 fir_tb.uut.n604 fir_tb.uut.n605 fir_tb.uut.n606 fir_tb.uut.n607 fir_tb.uut.n608 fir_tb.uut.n609 fir_tb.uut.n610 fir_tb.uut.n611 fir_tb.uut.n612 fir_tb.uut.n613 fir_tb.uut.n614 fir_tb.uut.n615 fir_tb.uut.n616 fir_tb.uut.n617 fir_tb.uut.n618 fir_tb.uut.n619 fir_tb.uut.n620 fir_tb.uut.n621 fir_tb.uut.n622 fir_tb.uut.n623 fir_tb.uut.n624 fir_tb.uut.n625 fir_tb.uut.n626 fir_tb.uut.n627 fir_tb.uut.n628 fir_tb.uut.n629 fir_tb.uut.n630 fir_tb.uut.n631 fir_tb.uut.n632 fir_tb.uut.n633 fir_tb.uut.n634 fir_tb.uut.N999 fir_tb.uut.N998 fir_tb.uut.N1014 fir_tb.uut.N1013 fir_tb.uut.N1012 fir_tb.uut.N1011 fir_tb.uut.N1010 fir_tb.uut.N1009 fir_tb.uut.N1008 fir_tb.uut.N1007 fir_tb.uut.N1006 fir_tb.uut.N1005 fir_tb.uut.N1004 fir_tb.uut.N1003 fir_tb.uut.N1002 fir_tb.uut.N1001 fir_tb.uut.N1000 fir_tb.uut.n635 fir_tb.uut.n636 fir_tb.uut.n639 fir_tb.uut.n644 fir_tb.uut.n645 fir_tb.uut.n647 fir_tb.uut.n649 fir_tb.uut.n651 fir_tb.uut.n652 fir_tb.uut.n653 fir_tb.uut.n656 fir_tb.uut.n657 fir_tb.uut.n728 fir_tb.uut.n729 fir_tb.uut.n730 fir_tb.uut.n731 fir_tb.uut.n732 fir_tb.uut.n733 fir_tb.uut.n734 fir_tb.uut.n735 fir_tb.uut.n736 fir_tb.uut.n737 fir_tb.uut.n738 fir_tb.uut.n739 fir_tb.uut.n740 fir_tb.uut.n741 fir_tb.uut.n742 fir_tb.uut.n743 fir_tb.uut.n744 fir_tb.uut.n745 fir_tb.uut.n746 fir_tb.uut.n747 fir_tb.uut.n748 fir_tb.uut.n749 fir_tb.uut.n750 fir_tb.uut.n751 fir_tb.uut.n752 fir_tb.uut.n753 fir_tb.uut.n754 fir_tb.uut.n755 fir_tb.uut.n756 fir_tb.uut.n757 fir_tb.uut.n758 fir_tb.uut.n759 fir_tb.uut.n760 fir_tb.uut.n761 fir_tb.uut.n762 fir_tb.uut.n763 fir_tb.uut.n764 fir_tb.uut.n765 fir_tb.uut.n766 fir_tb.uut.n767 fir_tb.uut.n768 fir_tb.uut.n769 fir_tb.uut.n770 fir_tb.uut.n771 fir_tb.uut.n772 fir_tb.uut.n773 fir_tb.uut.n774 fir_tb.uut.n775 fir_tb.uut.n776 fir_tb.uut.n777 fir_tb.uut.n778 fir_tb.uut.n779 fir_tb.uut.n780 fir_tb.uut.n781 fir_tb.uut.n782 fir_tb.uut.n783 fir_tb.uut.n784 fir_tb.uut.n785 fir_tb.uut.n786 fir_tb.uut.n787 fir_tb.uut.n788 fir_tb.uut.n789 fir_tb.uut.n790 fir_tb.uut.n791 fir_tb.uut.n792 fir_tb.uut.n793 fir_tb.uut.n794 fir_tb.uut.n795 fir_tb.uut.n796 fir_tb.uut.n797 fir_tb.uut.n798 fir_tb.uut.n799 fir_tb.uut.n800 fir_tb.uut.n801 fir_tb.uut.n802 fir_tb.uut.n803 fir_tb.uut.n804 fir_tb.uut.n805 fir_tb.uut.n806 fir_tb.uut.n807 fir_tb.uut.n808 fir_tb.uut.n809 fir_tb.uut.n810 fir_tb.uut.n811 fir_tb.uut.n813 fir_tb.uut.n814 fir_tb.uut.n815 fir_tb.uut.n816 fir_tb.uut.n817 fir_tb.uut.n818 fir_tb.uut.n819 fir_tb.uut.n820 fir_tb.uut.n821 fir_tb.uut.n822 fir_tb.uut.n823 fir_tb.uut.n824 fir_tb.uut.n825 fir_tb.uut.n826 fir_tb.uut.n827 fir_tb.uut.n828 fir_tb.uut.n829 fir_tb.uut.n830 fir_tb.uut.n831 fir_tb.uut.n832 fir_tb.uut.n833 fir_tb.uut.n834 fir_tb.uut.n835 fir_tb.uut.n836 fir_tb.uut.n837 fir_tb.uut.n838 fir_tb.uut.n839 fir_tb.uut.n840 fir_tb.uut.n841 fir_tb.uut.n842 fir_tb.uut.n843 fir_tb.uut.n844 fir_tb.uut.n845 fir_tb.uut.n846 fir_tb.uut.n847 fir_tb.uut.n848 fir_tb.uut.n849 fir_tb.uut.n850 fir_tb.uut.n851 fir_tb.uut.n852 }
gui_sg_addsignal -group "$_session_group_1" { fir_tb.uut.n853 fir_tb.uut.n854 fir_tb.uut.n855 fir_tb.uut.n856 fir_tb.uut.n857 fir_tb.uut.n858 fir_tb.uut.n859 fir_tb.uut.n860 fir_tb.uut.n861 fir_tb.uut.n862 fir_tb.uut.n863 fir_tb.uut.n864 fir_tb.uut.n865 fir_tb.uut.n866 fir_tb.uut.n867 fir_tb.uut.n868 fir_tb.uut.n869 fir_tb.uut.n870 fir_tb.uut.n871 fir_tb.uut.n872 fir_tb.uut.n873 fir_tb.uut.n874 fir_tb.uut.n875 fir_tb.uut.n876 fir_tb.uut.n877 fir_tb.uut.n878 fir_tb.uut.n879 fir_tb.uut.n880 fir_tb.uut.n881 fir_tb.uut.n882 fir_tb.uut.n883 fir_tb.uut.n884 fir_tb.uut.n885 fir_tb.uut.n891 fir_tb.uut.n894 fir_tb.uut.n895 fir_tb.uut.SYNOPSYS_UNCONNECTED_1 fir_tb.uut.SYNOPSYS_UNCONNECTED_2 fir_tb.uut.SYNOPSYS_UNCONNECTED_3 fir_tb.uut.SYNOPSYS_UNCONNECTED_4 fir_tb.uut.SYNOPSYS_UNCONNECTED_5 fir_tb.uut.SYNOPSYS_UNCONNECTED_6 fir_tb.uut.data_reg_0 fir_tb.uut.data_reg_1 fir_tb.uut.data_reg_2 fir_tb.uut.data_reg_3 fir_tb.uut.data_reg_4 fir_tb.uut.data_reg_5 fir_tb.uut.multiplication_0 fir_tb.uut.multiplication_1 fir_tb.uut.multiplication_2 fir_tb.uut.multiplication_3 fir_tb.uut.multiplication_4 fir_tb.uut.multiplication_5 fir_tb.uut.sum_1 fir_tb.uut.sum_2 fir_tb.uut.sum_3 }
gui_set_radix -radix {decimal} -signals {Sim:fir_tb.i}
gui_set_radix -radix {twosComplement} -signals {Sim:fir_tb.i}
gui_set_radix -radix {decimal} -signals {Sim:fir_tb.CLK_PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:fir_tb.CLK_PERIOD}

set _session_group_2 Group2
gui_sg_create "$_session_group_2"
set Group2 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { fir_tb.i fir_tb.data_out fir_tb.complete fir_tb.clk fir_tb.rst_n fir_tb.data_in fir_tb.enable fir_tb.enable fir_tb.tap fir_tb.CLK_PERIOD }
gui_set_radix -radix {decimal} -signals {Sim:fir_tb.i}
gui_set_radix -radix {twosComplement} -signals {Sim:fir_tb.i}
gui_set_radix -radix {decimal} -signals {Sim:fir_tb.CLK_PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:fir_tb.CLK_PERIOD}

set _session_group_3 Group3
gui_sg_create "$_session_group_3"
set Group3 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { fir_tb.i fir_tb.data_out fir_tb.complete fir_tb.clk fir_tb.rst_n fir_tb.data_in fir_tb.enable fir_tb.tap fir_tb.CLK_PERIOD fir_tb.uut.tap fir_tb.uut.data_in fir_tb.uut.data_out fir_tb.uut.clk fir_tb.uut.rst_n fir_tb.uut.enable fir_tb.uut.complete fir_tb.uut.mul_stage fir_tb.uut.add_stage1 fir_tb.uut.add_stage2 fir_tb.uut.data_reg_0 fir_tb.uut.data_reg_1 fir_tb.uut.data_reg_2 fir_tb.uut.data_reg_3 fir_tb.uut.data_reg_4 fir_tb.uut.data_reg_5 fir_tb.uut.multiplication_0 fir_tb.uut.multiplication_1 fir_tb.uut.multiplication_2 fir_tb.uut.multiplication_3 fir_tb.uut.multiplication_4 fir_tb.uut.multiplication_5 fir_tb.uut.sum_1 fir_tb.uut.sum_2 fir_tb.uut.sum_3 }
gui_set_radix -radix {decimal} -signals {Sim:fir_tb.i}
gui_set_radix -radix {twosComplement} -signals {Sim:fir_tb.i}
gui_set_radix -radix {decimal} -signals {Sim:fir_tb.CLK_PERIOD}
gui_set_radix -radix {twosComplement} -signals {Sim:fir_tb.CLK_PERIOD}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Global: Watch 'Watch'

gui_watch_page_delete -id Watch -all
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 1}
gui_watch_list_add_expr -id Watch -expr {i[31:0]} -meta fir_tb.i -type Integer -nonlocal -scope fir_tb

gui_watch_list_add_expr -id Watch -expr {data_out[17:0]} -meta fir_tb.data_out -type Wire -nonlocal -scope fir_tb

gui_watch_list_add_expr -id Watch -expr {complete[0:0]} -meta fir_tb.complete -type Wire -nonlocal -scope fir_tb

gui_watch_list_add_expr -id Watch -expr clk -meta fir_tb.clk -type Reg -nonlocal -scope fir_tb

gui_watch_list_add_expr -id Watch -expr rst_n -meta fir_tb.rst_n -type Reg -nonlocal -scope fir_tb

gui_watch_list_add_expr -id Watch -expr {data_in[15:0]} -meta fir_tb.data_in -type Reg -nonlocal -scope fir_tb

gui_watch_list_add_expr -id Watch -expr enable -meta fir_tb.enable -type {} -nonlocal -scope Sim:fir_tb.enable

gui_watch_list_add_expr -id Watch -expr {tap[2:0]} -meta fir_tb.tap -type {} -nonlocal -scope Sim:fir_tb.tap

gui_watch_list_add_expr -id Watch -expr {CLK_PERIOD[31:0]} -meta fir_tb.CLK_PERIOD -type {} -nonlocal -scope Sim:fir_tb.CLK_PERIOD

gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 2}
gui_watch_page_add -id Watch
gui_watch_page_rename -id Watch -name {Watch 3}

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 105885150000



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} fir_tb}
catch {gui_list_select -id ${Hier.1} {fir_tb.uut}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {fir_tb.uut}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {fir_tb.uut.tap fir_tb.uut.data_in fir_tb.uut.data_out fir_tb.uut.clk fir_tb.uut.rst_n fir_tb.uut.enable fir_tb.uut.complete fir_tb.uut.mul_stage fir_tb.uut.add_stage1 fir_tb.uut.add_stage2 fir_tb.uut.data_reg_0 fir_tb.uut.data_reg_1 fir_tb.uut.data_reg_2 fir_tb.uut.data_reg_3 fir_tb.uut.data_reg_4 fir_tb.uut.data_reg_5 fir_tb.uut.multiplication_0 fir_tb.uut.multiplication_1 fir_tb.uut.multiplication_2 fir_tb.uut.multiplication_3 fir_tb.uut.multiplication_4 fir_tb.uut.multiplication_5 fir_tb.uut.sum_1 fir_tb.uut.sum_2 fir_tb.uut.sum_3 }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active fir_tb.uut.multiplication_2_reg_1_ /afs/ee.ust.hk/staff/ee/dept/public/elec516/eesm_5020_2017spring/eesm_5020/lib/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/Verilog/NangateOpenCellLibrary.v
gui_view_scroll -id ${Source.1} -vertical -set 3180
gui_src_set_reusable -id ${Source.1}

# Watch 'Watch.1'
gui_watch_page_activate -id ${Watch.1} -page {Watch 1}
gui_list_set_filter -id ${Watch.1} -page {Watch 1} -list { {static 1} {randc 1} {public 1} {Parameter 1} {protected 1} {OtherTypes 1} {array 1} {local 1} {class 1} {AllTypes 1} {rand 1} {constraint 1} }
gui_list_set_filter -id ${Watch.1} -page {Watch 1} -text {*}
gui_watch_list_scroll_to -id ${Watch.1} -horz 0 -vert 0
gui_watch_page_activate -id ${Watch.1} -page {Watch 2}
gui_list_set_filter -id ${Watch.1} -page {Watch 2} -list { {static 1} {randc 1} {public 1} {Parameter 1} {protected 1} {OtherTypes 1} {array 1} {local 1} {class 1} {AllTypes 1} {rand 1} {constraint 1} }
gui_list_set_filter -id ${Watch.1} -page {Watch 2} -text {*}
gui_watch_page_activate -id ${Watch.1} -page {Watch 3}
gui_list_set_filter -id ${Watch.1} -page {Watch 3} -list { {static 1} {randc 1} {public 1} {Parameter 1} {protected 1} {OtherTypes 1} {array 1} {local 1} {class 1} {AllTypes 1} {rand 1} {constraint 1} }
gui_list_set_filter -id ${Watch.1} -page {Watch 3} -text {*}
gui_watch_page_activate -id ${Watch.1} -page {Watch 1}
gui_view_scroll -id ${Watch.1} -vertical -set 0
gui_view_scroll -id ${Watch.1} -horizontal -set 0
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DLPane.1}
}
#</Session>

