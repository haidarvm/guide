function disable_wp_community_events() {
    remove_meta_box('dashboard_primary', 'dashboard', 'side');
    remove_action('wp_ajax_get_community_events', 'wp_ajax_get_community_events');
}
add_action('wp_dashboard_setup', 'disable_wp_community_events', 999);


function remove_dashboard_widgets() {
    global $wp_meta_boxes;
    unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_activity']);
    unset($wp_meta_boxes['dashboard']['normal']['core']['dashboard_right_now']);
    unset($wp_meta_boxes['dashboard']['side']['core']['dashboard_primary']);
    unset($wp_meta_boxes['dashboard']['side']['core']['dashboard_quick_press']);
    unset($wp_meta_boxes['dashboard']['side']['core']['dashboard_recent_drafts']);
}
add_action('wp_dashboard_setup', 'remove_dashboard_widgets' );


add_filter('http_request_host_is_external', '__return_false');
