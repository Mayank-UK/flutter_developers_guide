import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/ui/views/dependency_management/view.dart';
import 'package:flutter_developers_guide/ui/views/third_party_services/sub_views/firebase_view.dart';
import 'package:flutter_developers_guide/ui/views/third_party_services/third_party_services_view.dart';
import 'package:flutter_developers_guide/ui/views/ui/sub_views/design_system/view.dart';

// routes
import './routes.dart';

// home
import '../../ui/views/page_not_found/view.dart';
import '../../ui/views/view.dart';
import '../../ui/views/dart_fundamentals/view.dart';
import '../../ui/views/flutter_fundamentals/view.dart';
import '../../ui/views/ui/view.dart';
import '../../ui/views/widget_catalog/view.dart';
import '../../ui/views/navigation_routing/view.dart';
import '../../ui/views/state_management/view.dart';
import '../../ui/views/native_device_features/view.dart';
import '../../ui/views/architecture/view.dart';
import '../../ui/views/best_practices/view.dart';
import '../../ui/views/supporting_classes_enums/view.dart';
import '../../ui/views/api_handling/view.dart';
import '../../ui/views/debugging/view.dart';
import '../../ui/views/testing/view.dart';
import '../../ui/views/lifecycle/view.dart';
import '../../ui/views/production_build_deployment/view.dart';

// dart fundamentals sub_views
import '../../ui/views/dart_fundamentals/sub_views/important_concepts/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/installation/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/keywords/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/variables/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/built_in_types/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/functions/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/operators/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/conditional_expression/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/cascade_notation/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/control_flow/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/exceptions/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/classes/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/generics/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/libraries_visibility/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/asynchronous/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/generators/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/callable_classes/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/isolates/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/typedefs/view.dart';
import '../../ui/views/dart_fundamentals/sub_views/comments/view.dart';

// flutter fundamentals sub_views
import '../../ui/views/flutter_fundamentals/sub_views/about_wigets/view.dart';
import '../../ui/views/flutter_fundamentals/sub_views/flutter_2/view.dart';
import '../../ui/views/flutter_fundamentals/sub_views/important_concepts_flutter/view.dart';
import '../../ui/views/flutter_fundamentals/sub_views/installation_setup_flutter/view.dart';
import '../../ui/views/flutter_fundamentals/sub_views/using_flutter/view.dart';

// ui
import '../../ui/views/ui/sub_views/responsive_adaptive_ui/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/ui_manipulation_view.dart';

// supporting classes sub_views
import '../../ui/views/supporting_classes_enums/sub_views/supporting_classes/view.dart';
import '../../ui/views/supporting_classes_enums/sub_views/supporting_enums/view.dart';

// lifecycle sub_views
import '../../ui/views/lifecycle/sub_views/application_lifecycle/view.dart';
import '../../ui/views/lifecycle/sub_views/widget_lifecycle/view.dart';

// testing
import '../../ui/views/testing/sub_views/unit_testing/view.dart';
import '../../ui/views/testing/sub_views/integration_testing/view.dart';

// production build and deployment
import '../../ui/views/production_build_deployment/sub_views/production_build/view.dart';
import '../../ui/views/production_build_deployment/sub_views/android_deployment/view.dart';
import '../../ui/views/production_build_deployment/sub_views/ios_deployment/view.dart';
import '../../ui/views/production_build_deployment/sub_views/web_deployment/view.dart';

// native device features
import '../../ui/views/native_device_features/sub_views/file_system/view.dart';
import '../../ui/views/native_device_features/sub_views/camera/view.dart';
import '../../ui/views/native_device_features/sub_views/location/view.dart';
import '../../ui/views/native_device_features/sub_views/bluetooth/view.dart';
import '../../ui/views/native_device_features/sub_views/share/view.dart';

// widget catalog main category
import '../../ui/views/widget_catalog/accessibility_widgets/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/view.dart';
import '../../ui/views/widget_catalog/asset_widgets/view.dart';
import '../../ui/views/widget_catalog/async_widgets/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/view.dart';
import '../../ui/views/widget_catalog/input_widgets/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/view.dart';
import '../../ui/views/widget_catalog/material_widgets/view.dart';
import '../../ui/views/widget_catalog/painting_effects/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/view.dart';
import '../../ui/views/widget_catalog/styling_widgets/view.dart';
import '../../ui/views/widget_catalog/text_widgets/view.dart';

// widget catalog accessibility
import '../../ui/views/widget_catalog/accessibility_widgets/sub_views/exclude_semantics_widget/view.dart';
import '../../ui/views/widget_catalog/accessibility_widgets/sub_views/merge_semantics_widget/view.dart';
import '../../ui/views/widget_catalog/accessibility_widgets/sub_views/semantics_widget/view.dart';

// widget catalog animation and motion
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_align_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_builder_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_container_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_cross_fade_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_default_text_style_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_list_state_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_modal_barrier_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_opacity_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_physical_model_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_positioned_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_size_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_widget_base_state_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/animated_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/decorated_box_transition_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/fade_transition_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/hero_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/positioned_transition_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/rotation_transition_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/scale_transition_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/size_transition_widget/view.dart';
import '../../ui/views/widget_catalog/animation_motion_widgets/sub_views/slide_transition_widget/view.dart';

// widget catalog assets
import '../../ui/views/widget_catalog/asset_widgets/sub_views/asset_bundle_widget/view.dart';
import '../../ui/views/widget_catalog/asset_widgets/sub_views/icon_widget/view.dart';
import '../../ui/views/widget_catalog/asset_widgets/sub_views/image_widget/view.dart';
import '../../ui/views/widget_catalog/asset_widgets/sub_views/raw_image_widget/view.dart';

// widget catalog async
import '../../ui/views/widget_catalog/async_widgets/sub_views/future_builder_widget/view.dart';
import '../../ui/views/widget_catalog/async_widgets/sub_views/stream_builder_widget/view.dart';

// widget catalog cupertino
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_action_sheet_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_activity_indicator_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_alert_dialog_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_button_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_context_menu_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_date_picker_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_dialog_action_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_dialog_full_screen_dialog_transition_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_dialog_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_navigation_bar_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_page_transition_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_picker_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_popup_surface_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_scaffold_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_scrollbar_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_search_field_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_segmented_control_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_slider_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_sliding_segmented_control_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_sliver_navigation_bar_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_switch_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_tab_bar_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_tab_scaffold_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_tab_view_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_text_field_widget/view.dart';
import '../../ui/views/widget_catalog/cupertino_widgets/sub_views/cupertino_time_picker_widget/view.dart';

// widget catalog input
import '../../ui/views/widget_catalog/input_widgets/sub_views/auto_complete_widget/view.dart';
import '../../ui/views/widget_catalog/input_widgets/sub_views/form_field_widget/view.dart';
import '../../ui/views/widget_catalog/input_widgets/sub_views/raw_keyboard_listener_widget/view.dart';

// widget catalog interactive
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/absorb_pointer_widget/absorb_pointer_widget.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/dismissible_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/drag_target_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/draggable_scrollable_sheet_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/draggable_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/gesture_detector_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/ignore_pointer_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/interactive_viewer_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/long_press_draggable_widget/view.dart';
import '../../ui/views/widget_catalog/interactive_widgets/sub_views/scrollable_widget/view.dart';

// widget catalog layout
import '../../ui/views/widget_catalog/layout_widgets/sub_views/align_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/aspect_ratio_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/baseline_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/center_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/column_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/constrained_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/container_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/custom_multi_child_layout_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/custom_scroll_view_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/custom_single_child_layout_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/expanded_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/fitted_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/flow_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/fractionally_sized_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/grid_view_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/indexed_stack_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/intrinsic_height_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/intrinsic_width_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/layout_builder_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/limited_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/list_body_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/list_view_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/off_stage_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/over_flow_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/padding_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/row_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sized_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sized_overflow_box_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_app_bar_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_child_builder_delegate_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_child_list_delegate_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_fixed_extent_list_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_grid_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_list_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_padding_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_persistent_header_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/sliver_to_box_adaptor_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/stack_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/table_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/transform_widget/view.dart';
import '../../ui/views/widget_catalog/layout_widgets/sub_views/wrap_widget/view.dart';

// widget catalog material
import '../../ui/views/widget_catalog/material_widgets/sub_views/alert_dialog_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/app_bar_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/bottom_navigation_bar_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/bottom_sheet_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/card_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/checkbox_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/chip_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/circular_progress_indicator_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/data_table_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/divider_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/drawer_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/dropdown_button_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/elevated_button_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/expansion_panel_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/floating_action_button_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/icon_button_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/linear_progress_indicator_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/list_tile_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/material_app_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/outlined_button_widget/outlined_button_widget_view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/popup_menu_button_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/radio_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/scaffold_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/show_date_picker_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/simple_dialog_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/slider_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/snack_bar_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/stepper_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/switch_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/tab_bar_view_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/tab_bar_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/tab_page_selector_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/text_button_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/text_field_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/tool_tip_widget/view.dart';
import '../../ui/views/widget_catalog/material_widgets/sub_views/widget_app_widget/view.dart';

// widget catalog painting
import '../../ui/views/widget_catalog/painting_effects/sub_views/backdrop_filter_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/clip_oval_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/clip_path_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/clip_rect_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/custom_paint_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/decorated_box_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/fractional_translation_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/opacity_widget/view.dart';
import '../../ui/views/widget_catalog/painting_effects/sub_views/rotated_box_widget/view.dart';
// import '../../ui/views/widget_catalog/painting_effects/sub_views/transform_painting_effects_widget_view.dart';

// widget catalog scrolling

import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/nested_scroll_view_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/notification_listener_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/page_view_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/refresh_indicator_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/reorderable_list_view_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/scroll_configuration_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/scrollbar_widget/view.dart';
import '../../ui/views/widget_catalog/scrolling_widgets/sub_views/single_child_scroll_view_widget/view.dart';

// widget catalog styling

// widget catalog text
import '../../ui/views/widget_catalog/text_widgets/sub_views/default_text_style_widget/view.dart';
import '../../ui/views/widget_catalog/text_widgets/sub_views/rich_text_widget/view.dart';
import '../../ui/views/widget_catalog/text_widgets/sub_views/text_widget/view.dart';

// ui manipulation category
import '../../ui/views/ui/sub_views/ui_manipulation/alignment/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/interactive_behavior/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/borders/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/colors_and_backgrounds/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/dimensions_constraints/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/effects/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/icons_images/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/positioning/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/spacing/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/theme/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/text/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/visibility/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/layout/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/web_and_apps/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/media/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/form/view.dart';

// ui manipulation alignment sub_views

// ui manipulation interactive behavior sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/interactive_behavior/sub_views/click_behavior/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/interactive_behavior/sub_views/hover_behavior/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/interactive_behavior/sub_views/focus_behavior/view.dart';

// ui manipulation colors and backgrounds sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/colors_and_backgrounds/sub_views/colors/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/colors_and_backgrounds/sub_views/backgrounds/view.dart';

// ui manipulation dimensions and constraints sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/fixed_dimensions/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/percentage_dimensions/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/fractional_dimensions/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/constraints/view.dart';

// ui manipulation effects sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/effects/sub_views/shadow/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/effects/sub_views/opacity/view.dart';

// ui manipulation form sub_views

// ui manipulation icons and images sub_views

// ui manipulation layout sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/layout/sub_views/page_layout/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/layout/sub_views/basic_layout/view.dart';

// ui manipulation positioning sub_views

// ui manipulation spacing sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/spacing/sub_views/padding/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/spacing/sub_views/margin/view.dart';

// ui manipulation theme sub_views

// ui manipulation text sub_views

// ui manipulation media sub_views
import '../../ui/views/ui/sub_views/ui_manipulation/media/sub_views/video/view.dart';
import '../../ui/views/ui/sub_views/ui_manipulation/media/sub_views/audio/view.dart';

// ui manipulation responsive and adaptive ui sub_views
import '../../ui/views/ui/sub_views/responsive_adaptive_ui/sub_views/responsive_layout/view.dart';
import '../../ui/views/ui/sub_views/responsive_adaptive_ui/sub_views/adaptive_layout/view.dart';

// state management sub_views
import '../../ui/views/state_management/sub_views/state_management_basics/view.dart';
import '../../ui/views/state_management/sub_views/provider_state_management/view.dart';
import '../../ui/views/state_management/sub_views/todos_app_view.dart';

// router
class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // home
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.dartFundamentals:
        return MaterialPageRoute(
          builder: (_) => DartFundamentalsView(),
        );
      case RoutePaths.flutterFundamentals:
        return MaterialPageRoute(
          builder: (_) => FlutterFundamentalsView(),
        );
      case RoutePaths.ui:
        return MaterialPageRoute(
          builder: (_) => UIView(),
        );
      case RoutePaths.lifecycle:
        return MaterialPageRoute(
          builder: (_) => LifecycleView(),
        );
      case RoutePaths.widgetsCatalog:
        return MaterialPageRoute(
          builder: (_) => WidgetCatalogView(),
        );
      case RoutePaths.supportingClassesEnums:
        return MaterialPageRoute(
          builder: (_) => SupportingClassesEnumsView(),
        );
      case RoutePaths.navigationRouting:
        return MaterialPageRoute(
          builder: (_) => NavigationRoutingView(),
        );
      case RoutePaths.stateManagement:
        return MaterialPageRoute(
          builder: (_) => StateManagementView(),
        );
      case RoutePaths.apiHandling:
        return MaterialPageRoute(
          builder: (_) => ApiHandlingView(),
        );
      case RoutePaths.debugging:
        return MaterialPageRoute(
          builder: (_) => DebuggingView(),
        );
      case RoutePaths.testing:
        return MaterialPageRoute(
          builder: (_) => TestingView(),
        );
      case RoutePaths.nativeDeviceFeatures:
        return MaterialPageRoute(
          builder: (_) => NativeDeviceFeaturesView(),
        );
      case RoutePaths.architecture:
        return MaterialPageRoute(
          builder: (_) => ArchitectureView(),
        );
      case RoutePaths.bestPractices:
        return MaterialPageRoute(
          builder: (_) => BestPracticesView(),
        );
      case RoutePaths.productionBuildDeployment:
        return MaterialPageRoute(
          builder: (_) => ProductionBuildDeploymentView(),
        );
      case RoutePaths.dependencyManagement:
        return MaterialPageRoute(
          builder: (_) => DependencyManagementView(),
        );
      case RoutePaths.thirdPartyServices:
        return MaterialPageRoute(
          builder: (_) => ThirdPartyServicesView(),
        );

      // dart fundamentals
      case RoutePaths.importantConcepts:
        return MaterialPageRoute(
          builder: (_) => ImportantConceptsView(),
        );
      case RoutePaths.installation:
        return MaterialPageRoute(
          builder: (_) => InstallationView(),
        );
      case RoutePaths.keywords:
        return MaterialPageRoute(
          builder: (_) => KeywordsView(),
        );
      case RoutePaths.variables:
        return MaterialPageRoute(
          builder: (_) => VariablesView(),
        );
      case RoutePaths.buildInTypes:
        return MaterialPageRoute(
          builder: (_) => BuiltInTypesView(),
        );
      case RoutePaths.functions:
        return MaterialPageRoute(
          builder: (_) => FunctionsView(),
        );
      case RoutePaths.operators:
        return MaterialPageRoute(
          builder: (_) => OperatorsView(),
        );
      case RoutePaths.conditionalExpression:
        return MaterialPageRoute(
          builder: (_) => ConditionalExpressionView(),
        );
      case RoutePaths.cascadeNotation:
        return MaterialPageRoute(
          builder: (_) => CascadeNotationView(),
        );
      case RoutePaths.controlFlowStatements:
        return MaterialPageRoute(
          builder: (_) => ControlFlowStatementView(),
        );
      case RoutePaths.exceptions:
        return MaterialPageRoute(
          builder: (_) => ExceptionsView(),
        );
      case RoutePaths.classes:
        return MaterialPageRoute(
          builder: (_) => ClassesView(),
        );
      case RoutePaths.generics:
        return MaterialPageRoute(
          builder: (_) => GenericsView(),
        );
      case RoutePaths.generators:
        return MaterialPageRoute(
          builder: (_) => GeneratorsView(),
        );
      case RoutePaths.librariesVisibility:
        return MaterialPageRoute(
          builder: (_) => LibrariesVisibilityView(),
        );
      case RoutePaths.asynchrony:
        return MaterialPageRoute(
          builder: (_) => AsynchronousView(),
        );
      case RoutePaths.callableClasses:
        return MaterialPageRoute(
          builder: (_) => CallableClassesView(),
        );
      case RoutePaths.isolates:
        return MaterialPageRoute(
          builder: (_) => IsolatesView(),
        );
      case RoutePaths.typedefs:
        return MaterialPageRoute(
          builder: (_) => TypedefsView(),
        );
      case RoutePaths.comments:
        return MaterialPageRoute(
          builder: (_) => CommentsView(),
        );

      // flutter fundamentals
      case RoutePaths.importantConceptsFlutter:
        return MaterialPageRoute(
          builder: (_) => ImportantConceptsFlutterView(),
        );
      case RoutePaths.installationSetup:
        return MaterialPageRoute(
          builder: (_) => InstallationSetupFlutterView(),
        );
      case RoutePaths.usingFlutter:
        return MaterialPageRoute(
          builder: (_) => UsingFlutterView(),
        );
      case RoutePaths.aboutWidgets:
        return MaterialPageRoute(
          builder: (_) => AboutWidgetsView(),
        );
      case RoutePaths.flutter2:
        return MaterialPageRoute(
          builder: (_) => Flutter2View(),
        );

      // ui
      case RoutePaths.uiManipulation:
        return MaterialPageRoute(
          builder: (_) => UiManipulationView(),
        );
      case RoutePaths.designSystem:
        return MaterialPageRoute(
          builder: (_) => DesignSystemView(),
        );
      case RoutePaths.responsiveAdaptiveUi:
        return MaterialPageRoute(
          builder: (_) => ResponsiveAdaptiveLayoutView(),
        );

      // supporting classes and enums sub_views
      case RoutePaths.supportingClasses:
        return MaterialPageRoute(
          builder: (_) => SupportingClassesView(),
        );
      case RoutePaths.supportingEnums:
        return MaterialPageRoute(
          builder: (_) => SupportingEnumsView(),
        );

      // lifecycle sub_views
      case RoutePaths.applicationLifecycle:
        return MaterialPageRoute(
          builder: (_) => ApplicationLifecycleView(),
        );
      case RoutePaths.widgetLifecycle:
        return MaterialPageRoute(
          builder: (_) => WidgetLifecycleView(),
        );

      // interaction with external resources sub_views

      // testing
      case RoutePaths.unitTesting:
        return MaterialPageRoute(
          builder: (_) => UnitTestingView(),
        );
      case RoutePaths.integrationTesting:
        return MaterialPageRoute(
          builder: (_) => IntegrationTestingView(),
        );

      // production build and deployment
      case RoutePaths.productionBuild:
        return MaterialPageRoute(
          builder: (_) => ProductionBuildView(),
        );
      case RoutePaths.androidDeployment:
        return MaterialPageRoute(
          builder: (_) => AndroidDeploymentView(),
        );
      case RoutePaths.iosDeployment:
        return MaterialPageRoute(
          builder: (_) => IosDeploymentView(),
        );
      case RoutePaths.webDeployment:
        return MaterialPageRoute(
          builder: (_) => WebDeploymentView(),
        );

      // native device features
      case RoutePaths.fileSystem:
        return MaterialPageRoute(
          builder: (_) => FileSystemView(),
        );
      case RoutePaths.camera:
        return MaterialPageRoute(
          builder: (_) => CameraView(),
        );
      case RoutePaths.location:
        return MaterialPageRoute(
          builder: (_) => LocationView(),
        );
      case RoutePaths.bluetooth:
        return MaterialPageRoute(
          builder: (_) => BluetoothView(),
        );
      case RoutePaths.share:
        return MaterialPageRoute(
          builder: (_) => ShareView(),
        );

      // widget catalog category widgets
      case RoutePaths.accessibilityWidgets:
        return MaterialPageRoute(
          builder: (_) => AccessibilityWidgetsView(),
        );
      case RoutePaths.animationMotionWidgets:
        return MaterialPageRoute(
          builder: (_) => AnimationWidgetsView(),
        );
      case RoutePaths.assetWidgets:
        return MaterialPageRoute(
          builder: (_) => AssetWidgetsView(),
        );
      case RoutePaths.asyncWidgets:
        return MaterialPageRoute(
          builder: (_) => AsyncWidgetsView(),
        );
      case RoutePaths.cupertinoWidgets:
        return MaterialPageRoute(
          builder: (_) => CupertinoWidgetsView(),
        );
      case RoutePaths.inputWidgets:
        return MaterialPageRoute(
          builder: (_) => InputWidgetsView(),
        );
      case RoutePaths.interactiveWidgets:
        return MaterialPageRoute(
          builder: (_) => InteractiveWidgetsView(),
        );
      case RoutePaths.layoutWidgets:
        return MaterialPageRoute(
          builder: (_) => LayoutWidgetsView(),
        );
      case RoutePaths.materialWidgets:
        return MaterialPageRoute(
          builder: (_) => MaterialWidgetsView(),
        );
      case RoutePaths.paintingEffectWidgets:
        return MaterialPageRoute(
          builder: (_) => PaintingEffectsWidgetsView(),
        );
      case RoutePaths.scrollingWidgets:
        return MaterialPageRoute(
          builder: (_) => ScrollingWidgetsView(),
        );
      case RoutePaths.stylingWidgets:
        return MaterialPageRoute(
          builder: (_) => StylingWidgetsView(),
        );
      case RoutePaths.textWidgets:
        return MaterialPageRoute(
          builder: (_) => TextWidgetsView(),
        );

      // widget catalog accessibility widgets
      case RoutePaths.excludeSemanticsWidget:
        return MaterialPageRoute(
          builder: (_) => ExcludeSemanticsWidgetView(),
        );
      case RoutePaths.mergeSemanticsWidget:
        return MaterialPageRoute(
          builder: (_) => MergeSemanticsWidgetView(),
        );
      case RoutePaths.semanticsWidget:
        return MaterialPageRoute(
          builder: (_) => SemanticsWidgetView(),
        );

      // widget catalog animations and motion widgets
      case RoutePaths.animatedAlign:
        return MaterialPageRoute(
          builder: (_) => AnimatedAlignWidgetView(),
        );
      case RoutePaths.animatedBuilder:
        return MaterialPageRoute(
          builder: (_) => AnimatedBuilderWidgetView(),
        );
      case RoutePaths.animatedContainer:
        return MaterialPageRoute(
          builder: (_) => AnimatedContainerWidgetView(),
        );
      case RoutePaths.animatedCrossFade:
        return MaterialPageRoute(
          builder: (_) => AnimatedCrossFadeWidgetView(),
        );
      case RoutePaths.animatedDefaultTextStyle:
        return MaterialPageRoute(
          builder: (_) => AnimatedDefaultTextStyleWidgetView(),
        );
      case RoutePaths.animatedListState:
        return MaterialPageRoute(
          builder: (_) => AnimatedListStateWidgetView(),
        );
      case RoutePaths.animatedModalBarrier:
        return MaterialPageRoute(
          builder: (_) => AnimatedModalBarrierWidgetView(),
        );
      case RoutePaths.animatedOpacity:
        return MaterialPageRoute(
          builder: (_) => AnimatedOpacityWidgetView(),
        );
      case RoutePaths.animatedPhysicalModel:
        return MaterialPageRoute(
          builder: (_) => AnimatedPhysicalModelWidgetView(),
        );
      case RoutePaths.animatedPositioned:
        return MaterialPageRoute(
          builder: (_) => AnimatedPositionedWidgetView(),
        );
      case RoutePaths.animatedSize:
        return MaterialPageRoute(
          builder: (_) => AnimatedSizeWidgetView(),
        );
      case RoutePaths.animatedWidget:
        return MaterialPageRoute(
          builder: (_) => AnimatedWidgetWidgetView(),
        );
      case RoutePaths.animatedWidgetBaseState:
        return MaterialPageRoute(
          builder: (_) => AnimatedWidgetBaseStateWidgetView(),
        );
      case RoutePaths.decoratedBoxTransition:
        return MaterialPageRoute(
          builder: (_) => DecoratedBoxTransitionWidgetView(),
        );
      case RoutePaths.fadeTransition:
        return MaterialPageRoute(
          builder: (_) => FadeTransitionWidgetView(),
        );
      case RoutePaths.hero:
        return MaterialPageRoute(
          builder: (_) => HeroWidgetView(),
        );
      case RoutePaths.positionedTransition:
        return MaterialPageRoute(
          builder: (_) => PositionedTransitionWidgetView(),
        );
      case RoutePaths.rotationTransition:
        return MaterialPageRoute(
          builder: (_) => RotationTransitionWidgetView(),
        );
      case RoutePaths.scaleTransition:
        return MaterialPageRoute(
          builder: (_) => ScaleTransitionWidgetView(),
        );
      case RoutePaths.sizeTransition:
        return MaterialPageRoute(
          builder: (_) => SizeTransitionWidgetView(),
        );
      case RoutePaths.slideTransition:
        return MaterialPageRoute(
          builder: (_) => SlideTransitionWidgetView(),
        );

      // widget catalog assets, icons and images widgets
      case RoutePaths.assetBundle:
        return MaterialPageRoute(
          builder: (_) => AssetBundleWidgetView(),
        );
      case RoutePaths.icon:
        return MaterialPageRoute(
          builder: (_) => IconWidgetView(),
        );
      case RoutePaths.image:
        return MaterialPageRoute(
          builder: (_) => ImageWidgetView(),
        );
      case RoutePaths.rawImage:
        return MaterialPageRoute(
          builder: (_) => RawImageWidgetView(),
        );

      // widget catalog async widgets
      case RoutePaths.futureBuilder:
        return MaterialPageRoute(
          builder: (_) => FutureBuilderWidgetView(),
        );
      case RoutePaths.streamBuilder:
        return MaterialPageRoute(
          builder: (_) => StreamBuilderWidgetView(),
        );

      // widget catalog cupertino widgets
      case RoutePaths.cupertinoActionSheet:
        return MaterialPageRoute(
          builder: (_) => CupertinoActionSheetWidgetView(),
        );
      case RoutePaths.cupertinoActivityIndicator:
        return MaterialPageRoute(
          builder: (_) => CupertinoActivityIndicatorWidgetView(),
        );
      case RoutePaths.cupertinoAlertDialog:
        return MaterialPageRoute(
          builder: (_) => CupertinoAlertDialogWidgetView(),
        );
      case RoutePaths.cupertinoButton:
        return MaterialPageRoute(
          builder: (_) => CupertinoButtonWidgetView(),
        );
      case RoutePaths.cupertinoContextMenu:
        return MaterialPageRoute(
          builder: (_) => CupertinoContextMenuWidgetView(),
        );
      case RoutePaths.cupertinoDatePicker:
        return MaterialPageRoute(
          builder: (_) => CupertinoDatePickerWidgetView(),
        );
      case RoutePaths.cupertinoDialog:
        return MaterialPageRoute(
          builder: (_) => CupertinoDialogWidgetView(),
        );
      case RoutePaths.cupertinoDialogAction:
        return MaterialPageRoute(
          builder: (_) => CupertinoDialogActionWidgetView(),
        );
      case RoutePaths.cupertinoFullScreenDialogTransition:
        return MaterialPageRoute(
          builder: (_) => CupertinoFullScreenDialogTransitionWidgetView(),
        );
      case RoutePaths.cupertinoNavigationBar:
        return MaterialPageRoute(
          builder: (_) => CupertinoNavigationBarWidgetView(),
        );
      case RoutePaths.cupertinoScaffold:
        return MaterialPageRoute(
          builder: (_) => CupertinoScaffoldWidgetView(),
        );
      case RoutePaths.cupertinoPageTransition:
        return MaterialPageRoute(
          builder: (_) => CupertinoPageTransitionWidgetView(),
        );
      case RoutePaths.cupertinoPicker:
        return MaterialPageRoute(
          builder: (_) => CupertinoPickerWidgetView(),
        );
      case RoutePaths.cupertinoPopupSurface:
        return MaterialPageRoute(
          builder: (_) => CupertinoPopupSurfaceWidgetView(),
        );
      case RoutePaths.cupertinoScrollbar:
        return MaterialPageRoute(
          builder: (_) => CupertinoScrollbarWidgetView(),
        );
      case RoutePaths.cupertinoSearchField:
        return MaterialPageRoute(
          builder: (_) => CupertinoSearchFieldWidgetView(),
        );
      case RoutePaths.cupertinoSegmentedControl:
        return MaterialPageRoute(
          builder: (_) => CupertinoSegmentedControlWidgetView(),
        );
      case RoutePaths.cupertinoSlider:
        return MaterialPageRoute(
          builder: (_) => CupertinoSliderWidgetView(),
        );
      case RoutePaths.cupertinoSlidingSegmentedControl:
        return MaterialPageRoute(
          builder: (_) => CupertinoSlidingSegmentedControlWidgetView(),
        );
      case RoutePaths.cupertinoSliverNavigationBar:
        return MaterialPageRoute(
          builder: (_) => CupertinoSliverNavigationBarWidgetView(),
        );
      case RoutePaths.cupertinoNavigationBar:
        return MaterialPageRoute(
          builder: (_) => CupertinoNavigationBarWidgetView(),
        );
      case RoutePaths.cupertinoSwitch:
        return MaterialPageRoute(
          builder: (_) => CupertinoSwitchWidgetView(),
        );
      case RoutePaths.cupertinoTabBar:
        return MaterialPageRoute(
          builder: (_) => CupertinoTabBarWidgetView(),
        );
      case RoutePaths.cupertinoTabScaffold:
        return MaterialPageRoute(
          builder: (_) => CupertinoTabScaffoldWidgetView(),
        );
      case RoutePaths.cupertinoTabView:
        return MaterialPageRoute(
          builder: (_) => CupertinoTabViewWidgetView(),
        );
      case RoutePaths.cupertinoTextField:
        return MaterialPageRoute(
          builder: (_) => CupertinoTextFieldWidgetView(),
        );
      case RoutePaths.cupertinoTimePicker:
        return MaterialPageRoute(
          builder: (_) => CupertinoTimePickerWidgetView(),
        );

      // widget catalog input widgets
      case RoutePaths.autocomplete:
        return MaterialPageRoute(
          builder: (_) => AutoCompleteWidgetView(),
        );
      case RoutePaths.form:
        return MaterialPageRoute(
          builder: (_) => FormView(),
        );
      case RoutePaths.formField:
        return MaterialPageRoute(
          builder: (_) => FormFieldWidgetView(),
        );
      case RoutePaths.rawKeyboardListener:
        return MaterialPageRoute(
          builder: (_) => RawKeyboardListenerWidgetView(),
        );

      // widget catalog interactive widgets
      case RoutePaths.absorbPointer:
        return MaterialPageRoute(
          builder: (_) => AbsorbPointerWidgetView(),
        );
      case RoutePaths.dismissible:
        return MaterialPageRoute(
          builder: (_) => DismissibleWidgetView(),
        );
      case RoutePaths.dragTarget:
        return MaterialPageRoute(
          builder: (_) => DragTargetWidgetView(),
        );
      case RoutePaths.draggable:
        return MaterialPageRoute(
          builder: (_) => DraggableWidgetView(),
        );
      case RoutePaths.draggableScrollableSheet:
        return MaterialPageRoute(
          builder: (_) => DraggableScrollableSheetWidgetView(),
        );
      case RoutePaths.gestureDetector:
        return MaterialPageRoute(
          builder: (_) => GestureDetectorWidgetView(),
        );
      case RoutePaths.ignorePointer:
        return MaterialPageRoute(
          builder: (_) => IgnorePointerWidgetView(),
        );
      case RoutePaths.interactiveViewer:
        return MaterialPageRoute(
          builder: (_) => InteractiveViewerWidgetView(),
        );
      case RoutePaths.longPressDraggable:
        return MaterialPageRoute(
          builder: (_) => LongPressDraggableWidgetView(),
        );
      case RoutePaths.scrollable:
        return MaterialPageRoute(
          builder: (_) => ScrollableWidgetView(),
        );

      // widget catalog layout widgets
      case RoutePaths.align:
        return MaterialPageRoute(
          builder: (_) => AlignWidgetView(),
        );
      case RoutePaths.aspectRatio:
        return MaterialPageRoute(
          builder: (_) => AspectRatioWidgetView(),
        );
      case RoutePaths.baseline:
        return MaterialPageRoute(
          builder: (_) => BaselineWidgetView(),
        );
      case RoutePaths.center:
        return MaterialPageRoute(
          builder: (_) => CenterWidgetView(),
        );
      case RoutePaths.constrainedBox:
        return MaterialPageRoute(
          builder: (_) => ConstrainedBoxWidgetView(),
        );
      case RoutePaths.container:
        return MaterialPageRoute(
          builder: (_) => ContainerWidgetView(),
        );
      case RoutePaths.customSingleChildLayout:
        return MaterialPageRoute(
          builder: (_) => CustomSingleChildLayoutWidgetView(),
        );
      case RoutePaths.expanded:
        return MaterialPageRoute(
          builder: (_) => ExpandedWidgetView(),
        );
      case RoutePaths.fittedBox:
        return MaterialPageRoute(
          builder: (_) => FittedBoxWidgetView(),
        );
      case RoutePaths.fractionallySizedBox:
        return MaterialPageRoute(
          builder: (_) => FractionallySizedBoxWidgetView(),
        );
      case RoutePaths.intrinsicHeight:
        return MaterialPageRoute(
          builder: (_) => IntrinsicHeightWidgetView(),
        );
      case RoutePaths.intrinsicWidth:
        return MaterialPageRoute(
          builder: (_) => IntrinsicWidthWidgetView(),
        );
      case RoutePaths.limitedBox:
        return MaterialPageRoute(
          builder: (_) => LimitedBoxWidgetView(),
        );
      case RoutePaths.offStage:
        return MaterialPageRoute(
          builder: (_) => OffStageWidgetView(),
        );
      case RoutePaths.overflowBox:
        return MaterialPageRoute(
          builder: (_) => OverFlowBoxWidgetView(),
        );
      case RoutePaths.padding:
        return MaterialPageRoute(
          builder: (_) => PaddingWidgetView(),
        );
      case RoutePaths.sizedBox:
        return MaterialPageRoute(
          builder: (_) => SizedBoxWidgetView(),
        );
      case RoutePaths.sizedOverflowBox:
        return MaterialPageRoute(
          builder: (_) => SizedOverflowBoxWidgetView(),
        );
      case RoutePaths.transform:
        return MaterialPageRoute(
          builder: (_) => TransformWidgetView(),
        );
      case RoutePaths.column:
        return MaterialPageRoute(
          builder: (_) => ColumnWidgetView(),
        );
      case RoutePaths.customMultiChildLayout:
        return MaterialPageRoute(
          builder: (_) => CustomMultiChildLayoutWidgetView(),
        );
      case RoutePaths.flow:
        return MaterialPageRoute(
          builder: (_) => FlowWidgetView(),
        );
      case RoutePaths.gridView:
        return MaterialPageRoute(
          builder: (_) => GridViewWidgetView(),
        );
      case RoutePaths.indexedStack:
        return MaterialPageRoute(
          builder: (_) => IndexedStackWidgetView(),
        );
      case RoutePaths.layoutBuilder:
        return MaterialPageRoute(
          builder: (_) => LayoutBuilderWidgetView(),
        );
      case RoutePaths.listBody:
        return MaterialPageRoute(
          builder: (_) => ListBodyWidgetView(),
        );
      case RoutePaths.listView:
        return MaterialPageRoute(
          builder: (_) => ListViewWidgetView(),
        );
      case RoutePaths.row:
        return MaterialPageRoute(
          builder: (_) => RowWidgetView(),
        );
      case RoutePaths.stack:
        return MaterialPageRoute(
          builder: (_) => StackWidgetView(),
        );
      case RoutePaths.table:
        return MaterialPageRoute(
          builder: (_) => TableWidgetView(),
        );
      case RoutePaths.wrap:
        return MaterialPageRoute(
          builder: (_) => WrapWidgetView(),
        );
      case RoutePaths.customScrollView:
        return MaterialPageRoute(
          builder: (_) => CustomScrollViewWidgetView(),
        );
      case RoutePaths.sliverAppBar:
        return MaterialPageRoute(
          builder: (_) => SliverAppBarWidgetView(),
        );
      case RoutePaths.sliverChildBuilderDelegate:
        return MaterialPageRoute(
          builder: (_) => SliverChildBuilderDelegateWidgetView(),
        );
      case RoutePaths.sliverChildListDelegate:
        return MaterialPageRoute(
          builder: (_) => SliverChildListDelegateWidgetView(),
        );
      case RoutePaths.sliverFixedExtentList:
        return MaterialPageRoute(
          builder: (_) => SliverFixedExtentListWidgetView(),
        );
      case RoutePaths.sliverGrid:
        return MaterialPageRoute(
          builder: (_) => SliverGridWidgetView(),
        );
      case RoutePaths.sliverList:
        return MaterialPageRoute(
          builder: (_) => SliverListWidgetView(),
        );
      case RoutePaths.sliverPadding:
        return MaterialPageRoute(
          builder: (_) => SliverPaddingWidgetView(),
        );
      case RoutePaths.sliverPersistentHeader:
        return MaterialPageRoute(
          builder: (_) => SliverPersistentHeaderWidgetView(),
        );
      case RoutePaths.sliverToBoxAdaptor:
        return MaterialPageRoute(
          builder: (_) => SliverToBoxAdaptorWidgetView(),
        );

      // widget catalog material widgets
      case RoutePaths.appBar:
        return MaterialPageRoute(
          builder: (_) => AppBarWidgetView(),
        );
      case RoutePaths.bottomNavigationBar:
        return MaterialPageRoute(
          builder: (_) => BottomNavigationBarWidgetView(),
        );
      case RoutePaths.drawer:
        return MaterialPageRoute(
          builder: (_) => DrawerWidgetView(),
        );
      case RoutePaths.materialApp:
        return MaterialPageRoute(
          builder: (_) => MaterialAppWidgetView(),
        );
      case RoutePaths.scaffold:
        return MaterialPageRoute(
          builder: (_) => ScaffoldWidgetView(),
        );
      case RoutePaths.tabBar:
        return MaterialPageRoute(
          builder: (_) => TabBarWidgetView(),
        );
      case RoutePaths.tabBarView:
        return MaterialPageRoute(
          builder: (_) => TabBarViewWidgetView(),
        );
      case RoutePaths.tabPageSelector:
        return MaterialPageRoute(
          builder: (_) => TabPageSelectorWidgetView(),
        );
      case RoutePaths.widgetsApp:
        return MaterialPageRoute(
          builder: (_) => WidgetsAppWidgetView(),
        );
      case RoutePaths.dropdownButton:
        return MaterialPageRoute(
          builder: (_) => DropdownButtonWidgetView(),
        );
      case RoutePaths.elevatedButton:
        return MaterialPageRoute(
          builder: (_) => ElevatedButtonWidgetView(),
        );
      case RoutePaths.floatingActionButton:
        return MaterialPageRoute(
          builder: (_) => FloatingActionButtonWidgetView(),
        );
      case RoutePaths.iconButton:
        return MaterialPageRoute(
          builder: (_) => IconButtonWidgetView(),
        );
      case RoutePaths.outlineButton:
        return MaterialPageRoute(
          builder: (_) => OutlinedButtonWidgetView(),
        );
      case RoutePaths.popupMenuButton:
        return MaterialPageRoute(
          builder: (_) => PopupMenuButtonWidgetView(),
        );
      case RoutePaths.textButton:
        return MaterialPageRoute(
          builder: (_) => TextButtonWidgetView(),
        );
      case RoutePaths.checkBox:
        return MaterialPageRoute(
          builder: (_) => CheckboxWidgetView(),
        );
      case RoutePaths.showDatePicker:
        return MaterialPageRoute(
          builder: (_) => ShowDatePickerWidgetView(),
        );
      case RoutePaths.radio:
        return MaterialPageRoute(
          builder: (_) => RadioWidgetView(),
        );
      case RoutePaths.slider:
        return MaterialPageRoute(
          builder: (_) => SliderWidgetView(),
        );
      case RoutePaths.switchMaterial:
        return MaterialPageRoute(
          builder: (_) => SwitchWidgetView(),
        );
      case RoutePaths.textField:
        return MaterialPageRoute(
          builder: (_) => TextFieldWidgetView(),
        );
      case RoutePaths.alertDialog:
        return MaterialPageRoute(
          builder: (_) => AlertDialogWidgetView(),
        );
      case RoutePaths.bottomSheet:
        return MaterialPageRoute(
          builder: (_) => BottomSheetWidgetView(),
        );
      case RoutePaths.expansionPanel:
        return MaterialPageRoute(
          builder: (_) => ExpansionPanelWidgetView(),
        );
      case RoutePaths.simpleDialog:
        return MaterialPageRoute(
          builder: (_) => SimpleDialogWidgetView(),
        );
      case RoutePaths.snackBar:
        return MaterialPageRoute(
          builder: (_) => SnackBarWidgetView(),
        );
      case RoutePaths.card:
        return MaterialPageRoute(
          builder: (_) => CardWidgetView(),
        );
      case RoutePaths.chip:
        return MaterialPageRoute(
          builder: (_) => ChipWidgetView(),
        );
      case RoutePaths.circularProgressIndicator:
        return MaterialPageRoute(
          builder: (_) => CircularProgressIndicatorWidgetView(),
        );
      case RoutePaths.dataTable:
        return MaterialPageRoute(
          builder: (_) => DataTableWidgetView(),
        );
      case RoutePaths.gridViewMaterial:
        return MaterialPageRoute(
          builder: (_) => GridViewWidgetView(),
        );
      case RoutePaths.icon:
        return MaterialPageRoute(
          builder: (_) => IconWidgetView(),
        );
      case RoutePaths.linearProgressIndicator:
        return MaterialPageRoute(
          builder: (_) => LinearProgressIndicatorWidgetView(),
        );
      case RoutePaths.tooltip:
        return MaterialPageRoute(
          builder: (_) => TooltipWidgetView(),
        );
      case RoutePaths.divider:
        return MaterialPageRoute(
          builder: (_) => DividerWidgetView(),
        );
      case RoutePaths.listTile:
        return MaterialPageRoute(
          builder: (_) => ListTileWidgetView(),
        );
      case RoutePaths.stepper:
        return MaterialPageRoute(
          builder: (_) => StepperWidgetView(),
        );

      // widget catalog painting and effects widgets
      case RoutePaths.backDropFilter:
        return MaterialPageRoute(
          builder: (_) => BackdropFilterWidgetView(),
        );
      case RoutePaths.clipOval:
        return MaterialPageRoute(
          builder: (_) => ClipOvalWidgetView(),
        );
      case RoutePaths.clipPath:
        return MaterialPageRoute(
          builder: (_) => ClipPathWidgetView(),
        );
      case RoutePaths.clipRRect:
        return MaterialPageRoute(
          builder: (_) => ClipRectWidgetView(),
        );
      case RoutePaths.customPaint:
        return MaterialPageRoute(
          builder: (_) => CustomPaintWidgetView(),
        );
      case RoutePaths.decoratedBox:
        return MaterialPageRoute(
          builder: (_) => DecoratedBoxWidgetView(),
        );
      case RoutePaths.fractionalTranslation:
        return MaterialPageRoute(
          builder: (_) => FractionalTranslationWidgetView(),
        );
      case RoutePaths.opacity:
        return MaterialPageRoute(
          builder: (_) => OpacityWidgetView(),
        );
      case RoutePaths.rotatedBox:
        return MaterialPageRoute(
          builder: (_) => RotatedBoxWidgetView(),
        );
      case RoutePaths.transform:
        return MaterialPageRoute(
          builder: (_) => TransformWidgetView(),
        );

      // widget catalog scrolling widgets
      case RoutePaths.nestedScrollView:
        return MaterialPageRoute(
          builder: (_) => NestedScrollViewWidgetView(),
        );
      case RoutePaths.notificationListener:
        return MaterialPageRoute(
          builder: (_) => NotificationListenerWidgetView(),
        );
      case RoutePaths.pageView:
        return MaterialPageRoute(
          builder: (_) => PageViewWidgetView(),
        );
      case RoutePaths.refreshIndicator:
        return MaterialPageRoute(
          builder: (_) => RefreshIndicatorWidgetView(),
        );
      case RoutePaths.reorderableListView:
        return MaterialPageRoute(
          builder: (_) => ReorderableListViewWidgetView(),
        );
      case RoutePaths.scrollConfiguration:
        return MaterialPageRoute(
          builder: (_) => ScrollConfigurationWidgetView(),
        );
      case RoutePaths.scrollable:
        return MaterialPageRoute(
          builder: (_) => ScrollableWidgetView(),
        );
      case RoutePaths.scrollbar:
        return MaterialPageRoute(
          builder: (_) => ScrollbarWidgetView(),
        );
      case RoutePaths.singleChildScrollView:
        return MaterialPageRoute(
          builder: (_) => SingleChildScrollViewWidgetView(),
        );

      // widget catalog styling widgets

      // widget catalog text widgets
      case RoutePaths.defaultTextStyle:
        return MaterialPageRoute(
          builder: (_) => DefaultTextStyleWidgetView(),
        );
      case RoutePaths.richText:
        return MaterialPageRoute(
          builder: (_) => RichTextWidgetView(),
        );
      case RoutePaths.text:
        return MaterialPageRoute(
          builder: (_) => TextWidgetView(),
        );

      // ui manipulation category
      case RoutePaths.layout:
        return MaterialPageRoute(
          builder: (_) => LayoutView(),
        );
      case RoutePaths.alignment:
        return MaterialPageRoute(
          builder: (_) => AlignmentView(),
        );
      case RoutePaths.interactiveBehavior:
        return MaterialPageRoute(
          builder: (_) => InteractiveBehaviorView(),
        );
      case RoutePaths.borders:
        return MaterialPageRoute(
          builder: (_) => BordersView(),
        );
      case RoutePaths.colorsBackgrounds:
        return MaterialPageRoute(
          builder: (_) => ColorsBackgroundsView(),
        );
      case RoutePaths.dimensionsConstraints:
        return MaterialPageRoute(
          builder: (_) => DimenionsContraintsView(),
        );
      case RoutePaths.effects:
        return MaterialPageRoute(
          builder: (_) => EffectsView(),
        );
      case RoutePaths.iconsImages:
        return MaterialPageRoute(
          builder: (_) => IconsImagesView(),
        );
      case RoutePaths.positioning:
        return MaterialPageRoute(
          builder: (_) => PositioningView(),
        );
      case RoutePaths.spacing:
        return MaterialPageRoute(
          builder: (_) => SpacingView(),
        );
      case RoutePaths.themeManipulation:
        return MaterialPageRoute(
          builder: (_) => ThemeView(),
        );
      case RoutePaths.visibility:
        return MaterialPageRoute(
          builder: (_) => VisibilityView(),
        );
      case RoutePaths.textManipulation:
        return MaterialPageRoute(
          builder: (_) => TextView(),
        );
      case RoutePaths.webAndApps:
        return MaterialPageRoute(
          builder: (_) => WebAndAppsView(),
        );
      case RoutePaths.media:
        return MaterialPageRoute(
          builder: (_) => MediaView(),
        );
      case RoutePaths.responsiveAdaptiveUi:
        return MaterialPageRoute(
          builder: (_) => ResponsiveAdaptiveLayoutView(),
        );

      // ui manipulation layout
      case RoutePaths.pageLayout:
        return MaterialPageRoute(
          builder: (_) => PageLayoutView(),
        );
      case RoutePaths.basicLayout:
        return MaterialPageRoute(
          builder: (_) => BasicLayoutView(),
        );

      // ui manipulation alignment

      // ui manipulation interactive behavior
      case RoutePaths.clickBehavior:
        return MaterialPageRoute(
          builder: (_) => ClickBehaviorView(),
        );
      case RoutePaths.hoverBehavior:
        return MaterialPageRoute(
          builder: (_) => HoverBehaviorView(),
        );
      case RoutePaths.focusBehavior:
        return MaterialPageRoute(
          builder: (_) => FocusBehaviorView(),
        );

      // ui manipulation colors and backgrounds
      case RoutePaths.colors:
        return MaterialPageRoute(
          builder: (_) => ColorsView(),
        );
      case RoutePaths.backgrounds:
        return MaterialPageRoute(
          builder: (_) => BackgroundsView(),
        );

      // ui manipulation height and constraints
      case RoutePaths.fixedDimensions:
        return MaterialPageRoute(
          builder: (_) => FixedDimensionsView(),
        );
      case RoutePaths.percentageDimensions:
        return MaterialPageRoute(
          builder: (_) => PercentageDimensionsView(),
        );
      case RoutePaths.fractionalDimensions:
        return MaterialPageRoute(
          builder: (_) => FractionalDimensionsView(),
        );
      case RoutePaths.constraints:
        return MaterialPageRoute(
          builder: (_) => ConstraintsView(),
        );

      // ui manipulation effects
      case RoutePaths.shadows:
        return MaterialPageRoute(
          builder: (_) => ShadowsView(),
        );
      case RoutePaths.opacityEffect:
        return MaterialPageRoute(
          builder: (_) => OpacityView(),
        );

      // ui manipulation positioning

      // ui manipulation spacing
      case RoutePaths.paddingSpacing:
        return MaterialPageRoute(
          builder: (_) => PaddingSpacingView(),
        );
      case RoutePaths.marginSpacing:
        return MaterialPageRoute(
          builder: (_) => MarginSpacingView(),
        );

      // ui manipulation theme

      // ui manipulation text

      // ui manipulation visibility

      // ui manipulation media
      case RoutePaths.video:
        return MaterialPageRoute(
          builder: (_) => VideoView(),
        );
      case RoutePaths.audio:
        return MaterialPageRoute(
          builder: (_) => AudioView(),
        );

      // ui manipulation responsive adaptive ui
      case RoutePaths.responsiveUi:
        return MaterialPageRoute(
          builder: (_) => ResponsiveLayoutView(),
        );
      case RoutePaths.adaptiveUi:
        return MaterialPageRoute(
          builder: (_) => AdaptiveLayoutView(),
        );

      // third party services
      case RoutePaths.firebase:
        return MaterialPageRoute(
          builder: (_) => FirebaseView(),
        );

      // state management
      case RoutePaths.state_management_basics:
        return MaterialPageRoute(
          builder: (_) => StateManagementBasicsView(),
        );
      case RoutePaths.providerStateManagement:
        return MaterialPageRoute(
          builder: (_) => ProviderStateManagementView(),
        );
      case RoutePaths.state_management_todos_example:
        return MaterialPageRoute(
          builder: (_) => TodosAppView(),
        );

      default:
        return MaterialPageRoute(builder: (_) => PageNotFoundView());
    }
  }
}
