<?php

/**
 * Here is your custom functions.
 */
function haidar($name) {
    return $name . 's';
}

function base_url() {
    // $base_url = env('BASE_URL');
    $request = request();
    $base_url = env('PROTOCOL') . $request->header('host') . '/';
    return $base_url;
}

function imgFullPath() {
    $fullpath = '/assets/uploads/' . date('Y') . '/' . date('m') . '/';
    if (file_exists($fullpath)) {
        return $fullpath;
    }
    return  createImgPath();
}
