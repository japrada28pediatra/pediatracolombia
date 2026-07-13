<?php
define( 'WP_CACHE', true );

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'u553593952_EhgfW' );

/** Database username */
define( 'DB_USER', 'u553593952_E5z7y' );

/** Database password */
define( 'DB_PASSWORD', 'o9oPXVEoCU' );

/** Database hostname */
define( 'DB_HOST', '127.0.0.1' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'j@}l1:SsOcM8*^gG}8{U,4f}m=FPe6+%zsxF|)(Hf7sG2SR,E@H=RLv0LJbJ-_C]' );
define( 'SECURE_AUTH_KEY',   'in`a6|}Y7G8eTBm8 7w_C(tsAyG=MfeiY.&G!~OiFr6ik]w7S,7Vu?a@XK%}D10+' );
define( 'LOGGED_IN_KEY',     '>s@aR;urY#j,sTwZS&6CBs`7:&SYA4p#>?h4I_=|8C|@ltCC&Dx?olbmGr&nq::T' );
define( 'NONCE_KEY',         ',Bg~7<X Pn2*4L; (vE*`(H^B4CTaasPf7YP~Dt(b> *#65Ee7_A,(+yP-Y6mZM0' );
define( 'AUTH_SALT',         'dv[m03;|RS$ufh}73#mzxN^~Q<P/1D:7YfY1iJ;K/zu}XsBhR:%U_(3L_pdu8vvg' );
define( 'SECURE_AUTH_SALT',  '!^vKC6S[YT~r]sZo6o4a27!P~2TQM9(O)) pU!l&+_YR=9C;$,(3&{QKzqO/%mt&' );
define( 'LOGGED_IN_SALT',    'q,6F.8|6P3E&;;7s;u4Ebpol0`ZCz7lm:QD@z{rzJwXj4mwR{07S+&[5VuIVS]lw' );
define( 'NONCE_SALT',        '}v*[O0RLvHe;8P_.2n]l$]R-ce4BW{e).p;zF)[h&8nH{(#:$qR%lQ%7|b>um>Pi' );
define( 'WP_CACHE_KEY_SALT', 'TTB^K^mYL|](dtlA%[lue](bLBj5bz&af$=G_t0@osN>j4C{]X<l8&gI7|tjpytI' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define( 'FS_METHOD', 'direct' );
define( 'COOKIEHASH', 'fbff9183d94e7e45f98571bdb8123535' );
define( 'WP_AUTO_UPDATE_CORE', 'minor' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
