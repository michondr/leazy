#!/usr/bin/env php
<?php

function offline() {
    exit;
}

exec("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.GetAll string:'org.mpris.MediaPlayer2.Player' 2> /dev/null", $output, $stderr);

if(count($output) < 10) {
    offline();
}

$output = implode("", $output);

preg_match('/string\s+"xesam:artist"\s+variant\s+array\s+\[\s+string "([^"]+)"/', $output, $matches);
$x = [];
$artist = isset($matches[1]) ? $matches[1] : offline();

preg_match('/string "xesam:title"\s+variant\s+string "([^"]+)"/', $output, $matches);

$title = isset($matches[1]) ? $matches[1] : offline();

preg_match('/string "PlaybackStatus"         variant             string "([^"]+)"/', $output, $matches);

$playing = isset($matches[1]) ? $matches[1] : offline();
$playing = $playing == 'Playing';

if($playing) {
    echo "$artist - $title";
} else {
    $str = "$artist - $title";

    $first = mb_substr($str, 0, round(strlen($str)/2));
    $second = mb_substr($str, round(strlen($str)/2));

    function spice($in) {
        return "<span foreground='grey'>$in</span>";
    }

    $first = mb_substr($first, 0, -2);
    $second = mb_substr($second, 2);
    
    echo spice($first) . " [] " . spice($second);
}

