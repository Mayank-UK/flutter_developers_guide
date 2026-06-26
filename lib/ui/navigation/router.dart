import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/core/locator/locator.dart';
import 'package:flutter_developers_guide/ui/state_management/blocs/auth/auth_bloc.dart';
import 'package:flutter_developers_guide/ui/state_management/blocs/images/images_bloc.dart';
import 'package:flutter_developers_guide/ui/state_management/blocs/posts/post_bloc.dart';
import 'package:flutter_developers_guide/ui/state_management/blocs/todos/todos_bloc.dart';
import 'package:flutter_developers_guide/ui/screens/database_handling/view.dart';
import 'package:flutter_developers_guide/ui/screens/dependency_management/view.dart';
import 'package:flutter_developers_guide/ui/screens/exception_handling/view.dart';
import 'package:flutter_developers_guide/ui/screens/notification/view.dart';
import 'package:flutter_developers_guide/ui/screens/other_basics/sub_screens/background_tasks/view.dart';
import 'package:flutter_developers_guide/ui/screens/other_basics/sub_screens/native_bridging/view.dart';
import 'package:flutter_developers_guide/ui/screens/other_basics/view.dart';
import 'package:flutter_developers_guide/ui/screens/state_management/sub_views/bloc_state_management/sub_screens/posts_app/view.dart';
import 'package:flutter_developers_guide/ui/screens/state_management/sub_views/bloc_state_management/view.dart';
import 'package:flutter_developers_guide/ui/screens/state_management/sub_views/riverpod_state_management/sub_views/todo_app/view.dart';
import 'package:flutter_developers_guide/ui/screens/state_management/sub_views/riverpod_state_management/view.dart';
import 'package:flutter_developers_guide/ui/screens/third_party_services/sub_views/firebase/sub_views/firebase_analytics/firebase_analytics.dart';
import 'package:flutter_developers_guide/ui/screens/third_party_services/sub_views/firebase/sub_views/firebase_auth/view.dart';
import 'package:flutter_developers_guide/ui/screens/third_party_services/sub_views/firebase/sub_views/firebase_firestore/view.dart';
import 'package:flutter_developers_guide/ui/screens/third_party_services/sub_views/firebase/sub_views/firebase_storage/firebase_storage.dart';
import 'package:flutter_developers_guide/ui/screens/third_party_services/sub_views/firebase/view.dart';
import 'package:flutter_developers_guide/ui/screens/third_party_services/view.dart';
import 'package:flutter_developers_guide/ui/screens/ui/sub_views/design_system/view.dart';
import 'package:flutter_developers_guide/ui/screens/widget/view.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

import '../screens/page_not_found/view.dart';
import '../screens/home/view.dart';
import '../screens/dart_fundamentals/view.dart';
import '../screens/flutter_fundamentals/view.dart';
import '../screens/ui/view.dart';
import '../screens/widget_catalog/view.dart';
import '../screens/navigation_routing/view.dart';
import '../screens/state_management/view.dart';
import '../screens/native_device_features/view.dart';
import '../screens/architecture/view.dart';
import '../screens/best_practices/view.dart';
import '../screens/supporting_classes_enums/view.dart';
import '../screens/api_handling/view.dart';
import '../screens/debugging/view.dart';
import '../screens/testing/view.dart';
import '../screens/lifecycle/view.dart';
import '../screens/production_build_deployment/view.dart';

import '../screens/dart_fundamentals/sub_views/important_concepts/view.dart';
import '../screens/dart_fundamentals/sub_views/installation/view.dart';
import '../screens/dart_fundamentals/sub_views/keywords/view.dart';
import '../screens/dart_fundamentals/sub_views/variables/view.dart';
import '../screens/dart_fundamentals/sub_views/built_in_types/view.dart';
import '../screens/dart_fundamentals/sub_views/functions/view.dart';
import '../screens/dart_fundamentals/sub_views/operators/view.dart';
import '../screens/dart_fundamentals/sub_views/conditional_expression/view.dart';
import '../screens/dart_fundamentals/sub_views/cascade_notation/view.dart';
import '../screens/dart_fundamentals/sub_views/control_flow/view.dart';
import '../screens/dart_fundamentals/sub_views/exceptions/view.dart';
import '../screens/dart_fundamentals/sub_views/classes/view.dart';
import '../screens/dart_fundamentals/sub_views/generics/view.dart';
import '../screens/dart_fundamentals/sub_views/libraries_visibility/view.dart';
import '../screens/dart_fundamentals/sub_views/asynchronous/view.dart';
import '../screens/dart_fundamentals/sub_views/generators/view.dart';
import '../screens/dart_fundamentals/sub_views/callable_classes/view.dart';
import '../screens/dart_fundamentals/sub_views/isolates/view.dart';
import '../screens/dart_fundamentals/sub_views/typedefs/view.dart';
import '../screens/dart_fundamentals/sub_views/comments/view.dart';

import '../screens/flutter_fundamentals/sub_views/about_wigets/view.dart';
import '../screens/flutter_fundamentals/sub_views/important_concepts_flutter/view.dart';
import '../screens/flutter_fundamentals/sub_views/installation_setup_flutter/view.dart';
import '../screens/flutter_fundamentals/sub_views/using_flutter/view.dart';

import '../screens/ui/sub_views/responsive_adaptive_ui/view.dart';
import '../screens/ui/sub_views/ui_manipulation/view.dart';

import '../screens/supporting_classes_enums/sub_views/supporting_classes/view.dart';
import '../screens/supporting_classes_enums/sub_views/supporting_enums/view.dart';

import '../screens/lifecycle/sub_views/application_lifecycle/view.dart';
import '../screens/lifecycle/sub_views/widget_lifecycle/view.dart';

import '../screens/testing/sub_views/unit_testing/view.dart';
import '../screens/testing/sub_views/integration_testing/view.dart';

import '../screens/production_build_deployment/sub_views/production_build/view.dart';
import '../screens/production_build_deployment/sub_views/android_deployment/view.dart';
import '../screens/production_build_deployment/sub_views/ios_deployment/view.dart';
import '../screens/production_build_deployment/sub_views/web_deployment/view.dart';

import '../screens/native_device_features/sub_views/file_system/view.dart';
import '../screens/native_device_features/sub_views/camera/view.dart';
import '../screens/native_device_features/sub_views/location/view.dart';
import '../screens/native_device_features/sub_views/bluetooth/view.dart';
import '../screens/native_device_features/sub_views/share/view.dart';

import '../screens/widget_catalog/accessibility_widgets/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/view.dart';
import '../screens/widget_catalog/asset_widgets/view.dart';
import '../screens/widget_catalog/async_widgets/view.dart';
import '../screens/widget_catalog/cupertino_widgets/view.dart';
import '../screens/widget_catalog/input_widgets/view.dart';
import '../screens/widget_catalog/interactive_widgets/view.dart';
import '../screens/widget_catalog/layout_widgets/view.dart';
import '../screens/widget_catalog/material_widgets/view.dart';
import '../screens/widget_catalog/painting_effects/view.dart';
import '../screens/widget_catalog/scrolling_widgets/view.dart';
import '../screens/widget_catalog/styling_widgets/view.dart';
import '../screens/widget_catalog/text_widgets/view.dart';

import '../screens/widget_catalog/accessibility_widgets/sub_views/exclude_semantics_widget/view.dart';
import '../screens/widget_catalog/accessibility_widgets/sub_views/merge_semantics_widget/view.dart';
import '../screens/widget_catalog/accessibility_widgets/sub_views/semantics_widget/view.dart';

import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_align_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_builder_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_container_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_cross_fade_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_default_text_style_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_list_state_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_modal_barrier_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_opacity_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_physical_model_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_positioned_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_size_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_widget_base_state_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/animated_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/decorated_box_transition_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/fade_transition_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/hero_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/positioned_transition_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/rotation_transition_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/scale_transition_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/size_transition_widget/view.dart';
import '../screens/widget_catalog/animation_motion_widgets/sub_views/slide_transition_widget/view.dart';

import '../screens/widget_catalog/asset_widgets/sub_views/asset_bundle_widget/view.dart';
import '../screens/widget_catalog/asset_widgets/sub_views/icon_widget/view.dart';
import '../screens/widget_catalog/asset_widgets/sub_views/image_widget/view.dart';
import '../screens/widget_catalog/asset_widgets/sub_views/raw_image_widget/view.dart';

import '../screens/widget_catalog/async_widgets/sub_views/future_builder_widget/view.dart';
import '../screens/widget_catalog/async_widgets/sub_views/stream_builder_widget/view.dart';

import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_action_sheet_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_activity_indicator_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_alert_dialog_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_button_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_context_menu_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_date_picker_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_dialog_action_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_dialog_full_screen_dialog_transition_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_dialog_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_navigation_bar_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_page_transition_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_picker_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_popup_surface_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_scaffold_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_scrollbar_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_search_field_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_segmented_control_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_slider_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_sliding_segmented_control_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_sliver_navigation_bar_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_switch_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_tab_bar_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_tab_scaffold_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_tab_view_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_text_field_widget/view.dart';
import '../screens/widget_catalog/cupertino_widgets/sub_views/cupertino_time_picker_widget/view.dart';

import '../screens/widget_catalog/input_widgets/sub_views/auto_complete_widget/view.dart';
import '../screens/widget_catalog/input_widgets/sub_views/form_field_widget/view.dart';
import '../screens/widget_catalog/input_widgets/sub_views/raw_keyboard_listener_widget/view.dart';

import '../screens/widget_catalog/interactive_widgets/sub_views/absorb_pointer_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/dismissible_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/drag_target_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/draggable_scrollable_sheet_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/draggable_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/gesture_detector_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/ignore_pointer_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/interactive_viewer_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/long_press_draggable_widget/view.dart';
import '../screens/widget_catalog/interactive_widgets/sub_views/scrollable_widget/view.dart';

import '../screens/widget_catalog/layout_widgets/sub_views/align_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/aspect_ratio_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/baseline_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/center_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/column_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/constrained_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/container_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/custom_multi_child_layout_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/custom_scroll_view_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/custom_single_child_layout_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/expanded_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/fitted_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/flow_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/fractionally_sized_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/grid_view_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/indexed_stack_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/intrinsic_height_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/intrinsic_width_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/layout_builder_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/limited_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/list_body_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/list_view_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/off_stage_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/over_flow_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/padding_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/row_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sized_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sized_overflow_box_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_app_bar_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_child_builder_delegate_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_child_list_delegate_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_fixed_extent_list_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_grid_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_list_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_padding_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_persistent_header_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/sliver_to_box_adaptor_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/stack_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/table_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/transform_widget/view.dart';
import '../screens/widget_catalog/layout_widgets/sub_views/wrap_widget/view.dart';

import '../screens/widget_catalog/material_widgets/sub_views/alert_dialog_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/app_bar_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/bottom_navigation_bar_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/bottom_sheet_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/card_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/checkbox_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/chip_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/circular_progress_indicator_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/data_table_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/divider_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/drawer_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/dropdown_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/elevated_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/expansion_panel_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/floating_action_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/icon_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/linear_progress_indicator_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/list_tile_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/material_app_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/outlined_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/popup_menu_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/radio_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/scaffold_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/show_date_picker_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/simple_dialog_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/slider_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/snack_bar_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/stepper_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/switch_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/tab_bar_view_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/tab_bar_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/tab_page_selector_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/text_button_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/text_field_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/tool_tip_widget/view.dart';
import '../screens/widget_catalog/material_widgets/sub_views/widget_app_widget/view.dart';

import '../screens/widget_catalog/painting_effects/sub_views/backdrop_filter_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/clip_oval_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/clip_path_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/clip_rect_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/custom_paint_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/decorated_box_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/fractional_translation_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/opacity_widget/view.dart';
import '../screens/widget_catalog/painting_effects/sub_views/rotated_box_widget/view.dart';

import '../screens/widget_catalog/scrolling_widgets/sub_views/nested_scroll_view_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/notification_listener_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/page_view_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/refresh_indicator_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/reorderable_list_view_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/scroll_configuration_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/scrollbar_widget/view.dart';
import '../screens/widget_catalog/scrolling_widgets/sub_views/single_child_scroll_view_widget/view.dart';

import '../screens/widget_catalog/text_widgets/sub_views/default_text_style_widget/view.dart';
import '../screens/widget_catalog/text_widgets/sub_views/rich_text_widget/view.dart';
import '../screens/widget_catalog/text_widgets/sub_views/text_widget/view.dart';

import '../screens/ui/sub_views/ui_manipulation/alignment/view.dart';
import '../screens/ui/sub_views/ui_manipulation/interactive_behavior/view.dart';
import '../screens/ui/sub_views/ui_manipulation/borders/view.dart';
import '../screens/ui/sub_views/ui_manipulation/colors_and_backgrounds/view.dart';
import '../screens/ui/sub_views/ui_manipulation/dimensions_constraints/view.dart';
import '../screens/ui/sub_views/ui_manipulation/effects/view.dart';
import '../screens/ui/sub_views/ui_manipulation/icons_images/view.dart';
import '../screens/ui/sub_views/ui_manipulation/positioning/view.dart';
import '../screens/ui/sub_views/ui_manipulation/spacing/view.dart';
import '../screens/ui/sub_views/ui_manipulation/theme/view.dart';
import '../screens/ui/sub_views/ui_manipulation/text/view.dart';
import '../screens/ui/sub_views/ui_manipulation/visibility/view.dart';
import '../screens/ui/sub_views/ui_manipulation/layout/view.dart';
import '../screens/ui/sub_views/ui_manipulation/web_and_apps/view.dart';
import '../screens/ui/sub_views/ui_manipulation/media/view.dart';
import '../screens/ui/sub_views/ui_manipulation/form/view.dart';

import '../screens/ui/sub_views/ui_manipulation/interactive_behavior/sub_views/click_behavior/view.dart';
import '../screens/ui/sub_views/ui_manipulation/interactive_behavior/sub_views/hover_behavior/view.dart';
import '../screens/ui/sub_views/ui_manipulation/interactive_behavior/sub_views/focus_behavior/view.dart';

import '../screens/ui/sub_views/ui_manipulation/colors_and_backgrounds/sub_views/colors/view.dart';
import '../screens/ui/sub_views/ui_manipulation/colors_and_backgrounds/sub_views/backgrounds/view.dart';

import '../screens/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/fixed_dimensions/view.dart';
import '../screens/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/percentage_dimensions/view.dart';
import '../screens/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/fractional_dimensions/view.dart';
import '../screens/ui/sub_views/ui_manipulation/dimensions_constraints/sub_views/constraints/view.dart';

import '../screens/ui/sub_views/ui_manipulation/effects/sub_views/shadow/view.dart';
import '../screens/ui/sub_views/ui_manipulation/effects/sub_views/opacity/view.dart';

import '../screens/ui/sub_views/ui_manipulation/layout/sub_views/page_layout/view.dart';
import '../screens/ui/sub_views/ui_manipulation/layout/sub_views/basic_layout/view.dart';

import '../screens/ui/sub_views/ui_manipulation/spacing/sub_views/padding/view.dart';
import '../screens/ui/sub_views/ui_manipulation/spacing/sub_views/margin/view.dart';

import '../screens/ui/sub_views/ui_manipulation/media/sub_views/video/view.dart';
import '../screens/ui/sub_views/ui_manipulation/media/sub_views/audio/view.dart';

import '../screens/ui/sub_views/responsive_adaptive_ui/sub_views/responsive_layout/view.dart';
import '../screens/ui/sub_views/responsive_adaptive_ui/sub_views/adaptive_layout/view.dart';

import '../screens/state_management/sub_views/state_management_basics/view.dart';
import '../screens/state_management/sub_views/provider_state_management/view.dart';
import '../screens/state_management/sub_views/provider_state_management/sub_screens/todo_app/view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  observers: [
    locator<FirebaseAnalyticsObserver>(),
  ],
  errorBuilder: (context, state) => PageNotFoundView(),
  routes: [
    // ─── Home ───────────────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.home, builder: (context, state) => HomeView()),

    // ─── Top-level sections ──────────────────────────────────────────────────
    GoRoute(path: RoutePaths.dartFundamentals, builder: (context, state) => DartFundamentalsView()),
    GoRoute(path: RoutePaths.flutterFundamentals, builder: (context, state) => FlutterFundamentalsView()),
    GoRoute(path: RoutePaths.ui, builder: (context, state) => UIView()),
    GoRoute(path: RoutePaths.lifecycle, builder: (context, state) => LifecycleView()),
    GoRoute(path: RoutePaths.widgetsCatalog, builder: (context, state) => WidgetCatalogView()),
    GoRoute(path: RoutePaths.supportingClassesEnums, builder: (context, state) => SupportingClassesEnumsView()),
    GoRoute(path: RoutePaths.navigationRouting, builder: (context, state) => NavigationRoutingView()),
    GoRoute(path: RoutePaths.stateManagement, builder: (context, state) => StateManagementView()),
    GoRoute(path: RoutePaths.apiHandling, builder: (context, state) => ApiHandlingView()),
    GoRoute(path: RoutePaths.databaseHandling, builder: (context, state) => DatabaseHandlingView()),
    GoRoute(path: RoutePaths.exceptionHandling, builder: (context, state) => ExceptionHandlingView()),
    GoRoute(path: RoutePaths.debugging, builder: (context, state) => DebuggingView()),
    GoRoute(path: RoutePaths.testing, builder: (context, state) => TestingView()),
    GoRoute(path: RoutePaths.nativeDeviceFeatures, builder: (context, state) => NativeDeviceFeaturesView()),
    GoRoute(path: RoutePaths.notification, builder: (context, state) => NotificationView()),
    GoRoute(path: RoutePaths.widget, builder: (context, state) => WidgetView()),
    GoRoute(path: RoutePaths.otherBasics, builder: (context, state) => OtherBasicsView()),
    GoRoute(path: RoutePaths.architecture, builder: (context, state) => ArchitectureView()),
    GoRoute(path: RoutePaths.bestPractices, builder: (context, state) => BestPracticesView()),
    GoRoute(path: RoutePaths.productionBuildDeployment, builder: (context, state) => ProductionBuildDeploymentView()),
    GoRoute(path: RoutePaths.dependencyManagement, builder: (context, state) => DependencyManagementView()),
    GoRoute(path: RoutePaths.thirdPartyServices, builder: (context, state) => ThirdPartyServicesView()),

    // ─── Dart Fundamentals ───────────────────────────────────────────────────
    GoRoute(path: RoutePaths.importantConcepts, builder: (context, state) => ImportantConceptsView()),
    GoRoute(path: RoutePaths.installation, builder: (context, state) => InstallationView()),
    GoRoute(path: RoutePaths.keywords, builder: (context, state) => KeywordsView()),
    GoRoute(path: RoutePaths.variables, builder: (context, state) => VariablesView()),
    GoRoute(path: RoutePaths.buildInTypes, builder: (context, state) => BuiltInTypesView()),
    GoRoute(path: RoutePaths.functions, builder: (context, state) => FunctionsView()),
    GoRoute(path: RoutePaths.operators, builder: (context, state) => OperatorsView()),
    GoRoute(path: RoutePaths.conditionalExpression, builder: (context, state) => ConditionalExpressionView()),
    GoRoute(path: RoutePaths.cascadeNotation, builder: (context, state) => CascadeNotationView()),
    GoRoute(path: RoutePaths.controlFlowStatements, builder: (context, state) => ControlFlowStatementView()),
    GoRoute(path: RoutePaths.exceptions, builder: (context, state) => ExceptionsView()),
    GoRoute(path: RoutePaths.classes, builder: (context, state) => ClassesView()),
    GoRoute(path: RoutePaths.generics, builder: (context, state) => GenericsView()),
    GoRoute(path: RoutePaths.generators, builder: (context, state) => GeneratorsView()),
    GoRoute(path: RoutePaths.librariesVisibility, builder: (context, state) => LibrariesVisibilityView()),
    GoRoute(path: RoutePaths.asynchrony, builder: (context, state) => AsynchronousView()),
    GoRoute(path: RoutePaths.callableClasses, builder: (context, state) => CallableClassesView()),
    GoRoute(path: RoutePaths.isolates, builder: (context, state) => IsolatesView()),
    GoRoute(path: RoutePaths.typedefs, builder: (context, state) => TypedefsView()),
    GoRoute(path: RoutePaths.comments, builder: (context, state) => CommentsView()),

    // ─── Flutter Fundamentals ────────────────────────────────────────────────
    GoRoute(path: RoutePaths.importantConceptsFlutter, builder: (context, state) => ImportantConceptsFlutterView()),
    GoRoute(path: RoutePaths.installationSetup, builder: (context, state) => InstallationSetupFlutterView()),
    GoRoute(path: RoutePaths.usingFlutter, builder: (context, state) => UsingFlutterView()),
    GoRoute(path: RoutePaths.aboutWidgets, builder: (context, state) => AboutWidgetsView()),

    // ─── UI ──────────────────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.uiManipulation, builder: (context, state) => UiManipulationView()),
    GoRoute(path: RoutePaths.designSystem, builder: (context, state) => DesignSystemView()),
    GoRoute(path: RoutePaths.responsiveAdaptiveUi, builder: (context, state) => ResponsiveAdaptiveLayoutView()),

    // ─── Supporting Classes & Enums ──────────────────────────────────────────
    GoRoute(path: RoutePaths.supportingClasses, builder: (context, state) => SupportingClassesView()),
    GoRoute(path: RoutePaths.supportingEnums, builder: (context, state) => SupportingEnumsView()),

    // ─── Lifecycle ───────────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.applicationLifecycle, builder: (context, state) => ApplicationLifecycleView()),
    GoRoute(path: RoutePaths.widgetLifecycle, builder: (context, state) => WidgetLifecycleView()),

    // ─── Testing ─────────────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.unitTesting, builder: (context, state) => UnitTestingView()),
    GoRoute(path: RoutePaths.integrationTesting, builder: (context, state) => IntegrationTestingView()),

    // ─── Production Build & Deployment ───────────────────────────────────────
    GoRoute(path: RoutePaths.productionBuild, builder: (context, state) => ProductionBuildView()),
    GoRoute(path: RoutePaths.androidDeployment, builder: (context, state) => AndroidDeploymentView()),
    GoRoute(path: RoutePaths.iosDeployment, builder: (context, state) => IosDeploymentView()),
    GoRoute(path: RoutePaths.webDeployment, builder: (context, state) => WebDeploymentView()),

    // ─── Native Device Features ──────────────────────────────────────────────
    GoRoute(path: RoutePaths.fileSystem, builder: (context, state) => FileSystemView()),
    GoRoute(path: RoutePaths.camera, builder: (context, state) => CameraView()),
    GoRoute(path: RoutePaths.location, builder: (context, state) => LocationView()),
    GoRoute(path: RoutePaths.bluetooth, builder: (context, state) => BluetoothView()),
    GoRoute(path: RoutePaths.share, builder: (context, state) => ShareView()),

    // ─── Other Basics ────────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.nativeBridging, builder: (context, state) => NativeBridgingView()),
    GoRoute(path: RoutePaths.backgroundTask, builder: (context, state) => BackgroundTaskView()),

    // ─── Third Party Services ────────────────────────────────────────────────
    GoRoute(path: RoutePaths.firebase, builder: (context, state) => FirebaseView()),
    GoRoute(
      path: RoutePaths.firebaseAuth,
      builder: (context, state) => BlocProvider<AuthBloc>(
        create: (_) => locator<AuthBloc>(),
        child: FirebaseAuthView(),
      ),
    ),
    GoRoute(
      path: RoutePaths.firebaseFirestore,
      builder: (context, state) => BlocProvider<TodosBloc>(
        create: (_) => locator<TodosBloc>()..add(WatchTodos()),
        child: FirebaseFirestoreView(),
      ),
    ),
    GoRoute(
      path: RoutePaths.firebaseStorage,
      builder: (context, state) => BlocProvider<ImagesBloc>(
        create: (_) => locator<ImagesBloc>()..add(WatchImages()),
        child: FirebaseStorageView(),
      ),
    ),
    GoRoute(path: RoutePaths.firebaseAnalytics, builder: (context, state) => FirebaseAnalyticsView()),

    // ─── State Management ────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.state_management_basics, builder: (context, state) => StateManagementBasicsView()),
    GoRoute(path: RoutePaths.providerStateManagement, builder: (context, state) => ProviderStateManagementView()),
    GoRoute(path: RoutePaths.state_management_todos_example, builder: (context, state) => TodosAppView()),
    GoRoute(path: RoutePaths.riverpodStateManagement, builder: (context, state) => RiverpodStateManagementView()),
    GoRoute(path: RoutePaths.riverpod_state_management_todos_example, builder: (context, state) => RiverpodTodosScreen()),
    GoRoute(path: RoutePaths.blocStateManagement, builder: (context, state) => BlocStateManagementView()),
    GoRoute(
      path: RoutePaths.state_management_posts_example,
      builder: (context, state) => BlocProvider<PostsBloc>(
        create: (_) => locator<PostsBloc>()..add(FetchPosts()),
        child: PostsAppView(),
      ),
    ),

    // ─── Widget Catalog — Categories ─────────────────────────────────────────
    GoRoute(path: RoutePaths.accessibilityWidgets, builder: (context, state) => AccessibilityWidgetsView()),
    GoRoute(path: RoutePaths.animationMotionWidgets, builder: (context, state) => AnimationWidgetsView()),
    GoRoute(path: RoutePaths.assetWidgets, builder: (context, state) => AssetWidgetsView()),
    GoRoute(path: RoutePaths.asyncWidgets, builder: (context, state) => AsyncWidgetsView()),
    GoRoute(path: RoutePaths.cupertinoWidgets, builder: (context, state) => CupertinoWidgetsView()),
    GoRoute(path: RoutePaths.inputWidgets, builder: (context, state) => InputWidgetsView()),
    GoRoute(path: RoutePaths.interactiveWidgets, builder: (context, state) => InteractiveWidgetsView()),
    GoRoute(path: RoutePaths.layoutWidgets, builder: (context, state) => LayoutWidgetsView()),
    GoRoute(path: RoutePaths.materialWidgets, builder: (context, state) => MaterialWidgetsView()),
    GoRoute(path: RoutePaths.paintingEffectWidgets, builder: (context, state) => PaintingEffectsWidgetsView()),
    GoRoute(path: RoutePaths.scrollingWidgets, builder: (context, state) => ScrollingWidgetsView()),
    GoRoute(path: RoutePaths.stylingWidgets, builder: (context, state) => StylingWidgetsView()),
    GoRoute(path: RoutePaths.textWidgets, builder: (context, state) => TextWidgetsView()),

    // ─── Widget Catalog — Accessibility ──────────────────────────────────────
    GoRoute(path: RoutePaths.excludeSemanticsWidget, builder: (context, state) => ExcludeSemanticsWidgetView()),
    GoRoute(path: RoutePaths.mergeSemanticsWidget, builder: (context, state) => MergeSemanticsWidgetView()),
    GoRoute(path: RoutePaths.semanticsWidget, builder: (context, state) => SemanticsWidgetView()),

    // ─── Widget Catalog — Animation & Motion ─────────────────────────────────
    GoRoute(path: RoutePaths.animatedAlign, builder: (context, state) => AnimatedAlignWidgetView()),
    GoRoute(path: RoutePaths.animatedBuilder, builder: (context, state) => AnimatedBuilderWidgetView()),
    GoRoute(path: RoutePaths.animatedContainer, builder: (context, state) => AnimatedContainerWidgetView()),
    GoRoute(path: RoutePaths.animatedCrossFade, builder: (context, state) => AnimatedCrossFadeWidgetView()),
    GoRoute(path: RoutePaths.animatedDefaultTextStyle, builder: (context, state) => AnimatedDefaultTextStyleWidgetView()),
    GoRoute(path: RoutePaths.animatedListState, builder: (context, state) => AnimatedListStateWidgetView()),
    GoRoute(path: RoutePaths.animatedModalBarrier, builder: (context, state) => AnimatedModalBarrierWidgetView()),
    GoRoute(path: RoutePaths.animatedOpacity, builder: (context, state) => AnimatedOpacityWidgetView()),
    GoRoute(path: RoutePaths.animatedPhysicalModel, builder: (context, state) => AnimatedPhysicalModelWidgetView()),
    GoRoute(path: RoutePaths.animatedPositioned, builder: (context, state) => AnimatedPositionedWidgetView()),
    GoRoute(path: RoutePaths.animatedSize, builder: (context, state) => AnimatedSizeWidgetView()),
    GoRoute(path: RoutePaths.animatedWidget, builder: (context, state) => AnimatedWidgetWidgetView()),
    GoRoute(path: RoutePaths.animatedWidgetBaseState, builder: (context, state) => AnimatedWidgetBaseStateWidgetView()),
    GoRoute(path: RoutePaths.decoratedBoxTransition, builder: (context, state) => DecoratedBoxTransitionWidgetView()),
    GoRoute(path: RoutePaths.fadeTransition, builder: (context, state) => FadeTransitionWidgetView()),
    GoRoute(path: RoutePaths.hero, builder: (context, state) => HeroWidgetView()),
    GoRoute(path: RoutePaths.positionedTransition, builder: (context, state) => PositionedTransitionWidgetView()),
    GoRoute(path: RoutePaths.rotationTransition, builder: (context, state) => RotationTransitionWidgetView()),
    GoRoute(path: RoutePaths.scaleTransition, builder: (context, state) => ScaleTransitionWidgetView()),
    GoRoute(path: RoutePaths.sizeTransition, builder: (context, state) => SizeTransitionWidgetView()),
    GoRoute(path: RoutePaths.slideTransition, builder: (context, state) => SlideTransitionWidgetView()),

    // ─── Widget Catalog — Assets ──────────────────────────────────────────────
    GoRoute(path: RoutePaths.assetBundle, builder: (context, state) => AssetBundleWidgetView()),
    GoRoute(path: RoutePaths.icon, builder: (context, state) => IconWidgetView()),
    GoRoute(path: RoutePaths.image, builder: (context, state) => ImageWidgetView()),
    GoRoute(path: RoutePaths.rawImage, builder: (context, state) => RawImageWidgetView()),

    // ─── Widget Catalog — Async ───────────────────────────────────────────────
    GoRoute(path: RoutePaths.futureBuilder, builder: (context, state) => FutureBuilderWidgetView()),
    GoRoute(path: RoutePaths.streamBuilder, builder: (context, state) => StreamBuilderWidgetView()),

    // ─── Widget Catalog — Cupertino ───────────────────────────────────────────
    GoRoute(path: RoutePaths.cupertinoActionSheet, builder: (context, state) => CupertinoActionSheetWidgetView()),
    GoRoute(path: RoutePaths.cupertinoActivityIndicator, builder: (context, state) => CupertinoActivityIndicatorWidgetView()),
    GoRoute(path: RoutePaths.cupertinoAlertDialog, builder: (context, state) => CupertinoAlertDialogWidgetView()),
    GoRoute(path: RoutePaths.cupertinoButton, builder: (context, state) => CupertinoButtonWidgetView()),
    GoRoute(path: RoutePaths.cupertinoContextMenu, builder: (context, state) => CupertinoContextMenuWidgetView()),
    GoRoute(path: RoutePaths.cupertinoDatePicker, builder: (context, state) => CupertinoDatePickerWidgetView()),
    GoRoute(path: RoutePaths.cupertinoDialog, builder: (context, state) => CupertinoDialogWidgetView()),
    GoRoute(path: RoutePaths.cupertinoDialogAction, builder: (context, state) => CupertinoDialogActionWidgetView()),
    GoRoute(path: RoutePaths.cupertinoFullScreenDialogTransition, builder: (context, state) => CupertinoFullScreenDialogTransitionWidgetView()),
    GoRoute(path: RoutePaths.cupertinoNavigationBar, builder: (context, state) => CupertinoNavigationBarWidgetView()),
    GoRoute(path: RoutePaths.cupertinoScaffold, builder: (context, state) => CupertinoScaffoldWidgetView()),
    GoRoute(path: RoutePaths.cupertinoPageTransition, builder: (context, state) => CupertinoPageTransitionWidgetView()),
    GoRoute(path: RoutePaths.cupertinoPicker, builder: (context, state) => CupertinoPickerWidgetView()),
    GoRoute(path: RoutePaths.cupertinoPopupSurface, builder: (context, state) => CupertinoPopupSurfaceWidgetView()),
    GoRoute(path: RoutePaths.cupertinoScrollbar, builder: (context, state) => CupertinoScrollbarWidgetView()),
    GoRoute(path: RoutePaths.cupertinoSearchField, builder: (context, state) => CupertinoSearchFieldWidgetView()),
    GoRoute(path: RoutePaths.cupertinoSegmentedControl, builder: (context, state) => CupertinoSegmentedControlWidgetView()),
    GoRoute(path: RoutePaths.cupertinoSlider, builder: (context, state) => CupertinoSliderWidgetView()),
    GoRoute(path: RoutePaths.cupertinoSlidingSegmentedControl, builder: (context, state) => CupertinoSlidingSegmentedControlWidgetView()),
    GoRoute(path: RoutePaths.cupertinoSliverNavigationBar, builder: (context, state) => CupertinoSliverNavigationBarWidgetView()),
    GoRoute(path: RoutePaths.cupertinoSwitch, builder: (context, state) => CupertinoSwitchWidgetView()),
    GoRoute(path: RoutePaths.cupertinoTabBar, builder: (context, state) => CupertinoTabBarWidgetView()),
    GoRoute(path: RoutePaths.cupertinoTabScaffold, builder: (context, state) => CupertinoTabScaffoldWidgetView()),
    GoRoute(path: RoutePaths.cupertinoTabView, builder: (context, state) => CupertinoTabViewWidgetView()),
    GoRoute(path: RoutePaths.cupertinoTextField, builder: (context, state) => CupertinoTextFieldWidgetView()),
    GoRoute(path: RoutePaths.cupertinoTimePicker, builder: (context, state) => CupertinoTimePickerWidgetView()),

    // ─── Widget Catalog — Input ───────────────────────────────────────────────
    GoRoute(path: RoutePaths.autocomplete, builder: (context, state) => AutoCompleteWidgetView()),
    GoRoute(path: RoutePaths.formField, builder: (context, state) => FormFieldWidgetView()),
    GoRoute(path: RoutePaths.rawKeyboardListener, builder: (context, state) => RawKeyboardListenerWidgetView()),

    // ─── Widget Catalog — Interactive ─────────────────────────────────────────
    GoRoute(path: RoutePaths.absorbPointer, builder: (context, state) => AbsorbPointerWidgetView()),
    GoRoute(path: RoutePaths.dismissible, builder: (context, state) => DismissibleWidgetView()),
    GoRoute(path: RoutePaths.dragTarget, builder: (context, state) => DragTargetWidgetView()),
    GoRoute(path: RoutePaths.draggable, builder: (context, state) => DraggableWidgetView()),
    GoRoute(path: RoutePaths.draggableScrollableSheet, builder: (context, state) => DraggableScrollableSheetWidgetView()),
    GoRoute(path: RoutePaths.gestureDetector, builder: (context, state) => GestureDetectorWidgetView()),
    GoRoute(path: RoutePaths.ignorePointer, builder: (context, state) => IgnorePointerWidgetView()),
    GoRoute(path: RoutePaths.interactiveViewer, builder: (context, state) => InteractiveViewerWidgetView()),
    GoRoute(path: RoutePaths.longPressDraggable, builder: (context, state) => LongPressDraggableWidgetView()),
    GoRoute(path: RoutePaths.scrollable, builder: (context, state) => ScrollableWidgetView()),

    // ─── Widget Catalog — Layout ──────────────────────────────────────────────
    GoRoute(path: RoutePaths.align, builder: (context, state) => AlignWidgetView()),
    GoRoute(path: RoutePaths.aspectRatio, builder: (context, state) => AspectRatioWidgetView()),
    GoRoute(path: RoutePaths.baseline, builder: (context, state) => BaselineWidgetView()),
    GoRoute(path: RoutePaths.center, builder: (context, state) => CenterWidgetView()),
    GoRoute(path: RoutePaths.constrainedBox, builder: (context, state) => ConstrainedBoxWidgetView()),
    GoRoute(path: RoutePaths.container, builder: (context, state) => ContainerWidgetView()),
    GoRoute(path: RoutePaths.customSingleChildLayout, builder: (context, state) => CustomSingleChildLayoutWidgetView()),
    GoRoute(path: RoutePaths.expanded, builder: (context, state) => ExpandedWidgetView()),
    GoRoute(path: RoutePaths.fittedBox, builder: (context, state) => FittedBoxWidgetView()),
    GoRoute(path: RoutePaths.fractionallySizedBox, builder: (context, state) => FractionallySizedBoxWidgetView()),
    GoRoute(path: RoutePaths.intrinsicHeight, builder: (context, state) => IntrinsicHeightWidgetView()),
    GoRoute(path: RoutePaths.intrinsicWidth, builder: (context, state) => IntrinsicWidthWidgetView()),
    GoRoute(path: RoutePaths.limitedBox, builder: (context, state) => LimitedBoxWidgetView()),
    GoRoute(path: RoutePaths.offStage, builder: (context, state) => OffStageWidgetView()),
    GoRoute(path: RoutePaths.overflowBox, builder: (context, state) => OverFlowBoxWidgetView()),
    GoRoute(path: RoutePaths.padding, builder: (context, state) => PaddingWidgetView()),
    GoRoute(path: RoutePaths.sizedBox, builder: (context, state) => SizedBoxWidgetView()),
    GoRoute(path: RoutePaths.sizedOverflowBox, builder: (context, state) => SizedOverflowBoxWidgetView()),
    GoRoute(path: RoutePaths.transform, builder: (context, state) => TransformWidgetView()),
    GoRoute(path: RoutePaths.column, builder: (context, state) => ColumnWidgetView()),
    GoRoute(path: RoutePaths.customMultiChildLayout, builder: (context, state) => CustomMultiChildLayoutWidgetView()),
    GoRoute(path: RoutePaths.flow, builder: (context, state) => FlowWidgetView()),
    GoRoute(path: RoutePaths.gridView, builder: (context, state) => GridViewWidgetView()),
    GoRoute(path: RoutePaths.indexedStack, builder: (context, state) => IndexedStackWidgetView()),
    GoRoute(path: RoutePaths.layoutBuilder, builder: (context, state) => LayoutBuilderWidgetView()),
    GoRoute(path: RoutePaths.listBody, builder: (context, state) => ListBodyWidgetView()),
    GoRoute(path: RoutePaths.listView, builder: (context, state) => ListViewWidgetView()),
    GoRoute(path: RoutePaths.row, builder: (context, state) => RowWidgetView()),
    GoRoute(path: RoutePaths.stack, builder: (context, state) => StackWidgetView()),
    GoRoute(path: RoutePaths.table, builder: (context, state) => TableWidgetView()),
    GoRoute(path: RoutePaths.wrap, builder: (context, state) => WrapWidgetView()),
    GoRoute(path: RoutePaths.customScrollView, builder: (context, state) => CustomScrollViewWidgetView()),
    GoRoute(path: RoutePaths.sliverAppBar, builder: (context, state) => SliverAppBarWidgetView()),
    GoRoute(path: RoutePaths.sliverChildBuilderDelegate, builder: (context, state) => SliverChildBuilderDelegateWidgetView()),
    GoRoute(path: RoutePaths.sliverChildListDelegate, builder: (context, state) => SliverChildListDelegateWidgetView()),
    GoRoute(path: RoutePaths.sliverFixedExtentList, builder: (context, state) => SliverFixedExtentListWidgetView()),
    GoRoute(path: RoutePaths.sliverGrid, builder: (context, state) => SliverGridWidgetView()),
    GoRoute(path: RoutePaths.sliverList, builder: (context, state) => SliverListWidgetView()),
    GoRoute(path: RoutePaths.sliverPadding, builder: (context, state) => SliverPaddingWidgetView()),
    GoRoute(path: RoutePaths.sliverPersistentHeader, builder: (context, state) => SliverPersistentHeaderWidgetView()),
    GoRoute(path: RoutePaths.sliverToBoxAdaptor, builder: (context, state) => SliverToBoxAdaptorWidgetView()),

    // ─── Widget Catalog — Material ────────────────────────────────────────────
    GoRoute(path: RoutePaths.appBar, builder: (context, state) => AppBarWidgetView()),
    GoRoute(path: RoutePaths.bottomNavigationBar, builder: (context, state) => BottomNavigationBarWidgetView()),
    GoRoute(path: RoutePaths.drawer, builder: (context, state) => DrawerWidgetView()),
    GoRoute(path: RoutePaths.materialApp, builder: (context, state) => MaterialAppWidgetView()),
    GoRoute(path: RoutePaths.scaffold, builder: (context, state) => ScaffoldWidgetView()),
    GoRoute(path: RoutePaths.tabBar, builder: (context, state) => TabBarWidgetView()),
    GoRoute(path: RoutePaths.tabBarView, builder: (context, state) => TabBarViewWidgetView()),
    GoRoute(path: RoutePaths.tabPageSelector, builder: (context, state) => TabPageSelectorWidgetView()),
    GoRoute(path: RoutePaths.widgetsApp, builder: (context, state) => WidgetsAppWidgetView()),
    GoRoute(path: RoutePaths.dropdownButton, builder: (context, state) => DropdownButtonWidgetView()),
    GoRoute(path: RoutePaths.elevatedButton, builder: (context, state) => ElevatedButtonWidgetView()),
    GoRoute(path: RoutePaths.floatingActionButton, builder: (context, state) => FloatingActionButtonWidgetView()),
    GoRoute(path: RoutePaths.iconButton, builder: (context, state) => IconButtonWidgetView()),
    GoRoute(path: RoutePaths.outlineButton, builder: (context, state) => OutlinedButtonWidgetView()),
    GoRoute(path: RoutePaths.popupMenuButton, builder: (context, state) => PopupMenuButtonWidgetView()),
    GoRoute(path: RoutePaths.textButton, builder: (context, state) => TextButtonWidgetView()),
    GoRoute(path: RoutePaths.checkBox, builder: (context, state) => CheckboxWidgetView()),
    GoRoute(path: RoutePaths.showDatePicker, builder: (context, state) => ShowDatePickerWidgetView()),
    GoRoute(path: RoutePaths.radio, builder: (context, state) => RadioWidgetView()),
    GoRoute(path: RoutePaths.slider, builder: (context, state) => SliderWidgetView()),
    GoRoute(path: RoutePaths.switchMaterial, builder: (context, state) => SwitchWidgetView()),
    GoRoute(path: RoutePaths.textField, builder: (context, state) => TextFieldWidgetView()),
    GoRoute(path: RoutePaths.alertDialog, builder: (context, state) => AlertDialogWidgetView()),
    GoRoute(path: RoutePaths.bottomSheet, builder: (context, state) => BottomSheetWidgetView()),
    GoRoute(path: RoutePaths.expansionPanel, builder: (context, state) => ExpansionPanelWidgetView()),
    GoRoute(path: RoutePaths.simpleDialog, builder: (context, state) => SimpleDialogWidgetView()),
    GoRoute(path: RoutePaths.snackBar, builder: (context, state) => SnackBarWidgetView()),
    GoRoute(path: RoutePaths.card, builder: (context, state) => CardWidgetView()),
    GoRoute(path: RoutePaths.chip, builder: (context, state) => ChipWidgetView()),
    GoRoute(path: RoutePaths.circularProgressIndicator, builder: (context, state) => CircularProgressIndicatorWidgetView()),
    GoRoute(path: RoutePaths.dataTable, builder: (context, state) => DataTableWidgetView()),
    GoRoute(path: RoutePaths.gridViewMaterial, builder: (context, state) => GridViewWidgetView()),
    GoRoute(path: RoutePaths.linearProgressIndicator, builder: (context, state) => LinearProgressIndicatorWidgetView()),
    GoRoute(path: RoutePaths.tooltip, builder: (context, state) => TooltipWidgetView()),
    GoRoute(path: RoutePaths.divider, builder: (context, state) => DividerWidgetView()),
    GoRoute(path: RoutePaths.listTile, builder: (context, state) => ListTileWidgetView()),
    GoRoute(path: RoutePaths.stepper, builder: (context, state) => StepperWidgetView()),

    // ─── Widget Catalog — Painting & Effects ──────────────────────────────────
    GoRoute(path: RoutePaths.backDropFilter, builder: (context, state) => BackdropFilterWidgetView()),
    GoRoute(path: RoutePaths.clipOval, builder: (context, state) => ClipOvalWidgetView()),
    GoRoute(path: RoutePaths.clipPath, builder: (context, state) => ClipPathWidgetView()),
    GoRoute(path: RoutePaths.clipRRect, builder: (context, state) => ClipRectWidgetView()),
    GoRoute(path: RoutePaths.customPaint, builder: (context, state) => CustomPaintWidgetView()),
    GoRoute(path: RoutePaths.decoratedBox, builder: (context, state) => DecoratedBoxWidgetView()),
    GoRoute(path: RoutePaths.fractionalTranslation, builder: (context, state) => FractionalTranslationWidgetView()),
    GoRoute(path: RoutePaths.opacity, builder: (context, state) => OpacityWidgetView()),
    GoRoute(path: RoutePaths.rotatedBox, builder: (context, state) => RotatedBoxWidgetView()),

    // ─── Widget Catalog — Scrolling ───────────────────────────────────────────
    GoRoute(path: RoutePaths.nestedScrollView, builder: (context, state) => NestedScrollViewWidgetView()),
    GoRoute(path: RoutePaths.notificationListener, builder: (context, state) => NotificationListenerWidgetView()),
    GoRoute(path: RoutePaths.pageView, builder: (context, state) => PageViewWidgetView()),
    GoRoute(path: RoutePaths.refreshIndicator, builder: (context, state) => RefreshIndicatorWidgetView()),
    GoRoute(path: RoutePaths.reorderableListView, builder: (context, state) => ReorderableListViewWidgetView()),
    GoRoute(path: RoutePaths.scrollConfiguration, builder: (context, state) => ScrollConfigurationWidgetView()),
    GoRoute(path: RoutePaths.scrollbar, builder: (context, state) => ScrollbarWidgetView()),
    GoRoute(path: RoutePaths.singleChildScrollView, builder: (context, state) => SingleChildScrollViewWidgetView()),

    // ─── Widget Catalog — Text ────────────────────────────────────────────────
    GoRoute(path: RoutePaths.defaultTextStyle, builder: (context, state) => DefaultTextStyleWidgetView()),
    GoRoute(path: RoutePaths.richText, builder: (context, state) => RichTextWidgetView()),
    GoRoute(path: RoutePaths.text, builder: (context, state) => TextWidgetView()),

    // ─── UI Manipulation ─────────────────────────────────────────────────────
    GoRoute(path: RoutePaths.layout, builder: (context, state) => LayoutView()),
    GoRoute(path: RoutePaths.alignment, builder: (context, state) => AlignmentView()),
    GoRoute(path: RoutePaths.interactiveBehavior, builder: (context, state) => InteractiveBehaviorView()),
    GoRoute(path: RoutePaths.borders, builder: (context, state) => BordersView()),
    GoRoute(path: RoutePaths.colorsBackgrounds, builder: (context, state) => ColorsBackgroundsView()),
    GoRoute(path: RoutePaths.dimensionsConstraints, builder: (context, state) => DimenionsContraintsView()),
    GoRoute(path: RoutePaths.effects, builder: (context, state) => EffectsView()),
    GoRoute(path: RoutePaths.iconsImages, builder: (context, state) => IconsImagesView()),
    GoRoute(path: RoutePaths.positioning, builder: (context, state) => PositioningView()),
    GoRoute(path: RoutePaths.spacing, builder: (context, state) => SpacingView()),
    GoRoute(path: RoutePaths.themeManipulation, builder: (context, state) => ThemeView()),
    GoRoute(path: RoutePaths.textManipulation, builder: (context, state) => TextView()),
    GoRoute(path: RoutePaths.visibility, builder: (context, state) => VisibilityView()),
    GoRoute(path: RoutePaths.webAndApps, builder: (context, state) => WebAndAppsView()),
    GoRoute(path: RoutePaths.media, builder: (context, state) => MediaView()),
    GoRoute(path: RoutePaths.pageLayout, builder: (context, state) => PageLayoutView()),
    GoRoute(path: RoutePaths.basicLayout, builder: (context, state) => BasicLayoutView()),
    GoRoute(path: RoutePaths.clickBehavior, builder: (context, state) => ClickBehaviorView()),
    GoRoute(path: RoutePaths.hoverBehavior, builder: (context, state) => HoverBehaviorView()),
    GoRoute(path: RoutePaths.focusBehavior, builder: (context, state) => FocusBehaviorView()),
    GoRoute(path: RoutePaths.colors, builder: (context, state) => ColorsView()),
    GoRoute(path: RoutePaths.backgrounds, builder: (context, state) => BackgroundsView()),
    GoRoute(path: RoutePaths.fixedDimensions, builder: (context, state) => FixedDimensionsView()),
    GoRoute(path: RoutePaths.percentageDimensions, builder: (context, state) => PercentageDimensionsView()),
    GoRoute(path: RoutePaths.fractionalDimensions, builder: (context, state) => FractionalDimensionsView()),
    GoRoute(path: RoutePaths.constraints, builder: (context, state) => ConstraintsView()),
    GoRoute(path: RoutePaths.shadows, builder: (context, state) => ShadowsView()),
    GoRoute(path: RoutePaths.opacityEffect, builder: (context, state) => OpacityView()),
    GoRoute(path: RoutePaths.paddingSpacing, builder: (context, state) => PaddingSpacingView()),
    GoRoute(path: RoutePaths.marginSpacing, builder: (context, state) => MarginSpacingView()),
    GoRoute(path: RoutePaths.video, builder: (context, state) => VideoView()),
    GoRoute(path: RoutePaths.audio, builder: (context, state) => AudioView()),
    GoRoute(path: RoutePaths.responsiveUi, builder: (context, state) => ResponsiveLayoutView()),
    GoRoute(path: RoutePaths.adaptiveUi, builder: (context, state) => AdaptiveLayoutView()),
  ],
);
