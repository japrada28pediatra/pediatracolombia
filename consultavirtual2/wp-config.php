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
define( 'DB_NAME', 'u553593952_l6GtT' );

/** Database username */
define( 'DB_USER', 'u553593952_3JOWl' );

/** Database password */
define( 'DB_PASSWORD', 'IpwiZIUudp' );

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
define( 'AUTH_KEY',          'Lif{RJeqkP~0+&wO8j5km-Ma. <f <}_W!8JGcx!_>_%.yrLV6VxWGSNt4tTbyAr' );
define( 'SECURE_AUTH_KEY',   '^ 8sQU!k.[Sp+d0O<}h4~H,Y2p&q5a~%ACmVGI@ALU,vx*p(=IM?[OXQGsS#A?qr' );
define( 'LOGGED_IN_KEY',     'aN9UB`x.qE-GNM].oMfx0tl|K&^)8!U4$j3d4PkP?9Or*#.,C>P8IH.V`{DGGVVl' );
define( 'NONCE_KEY',         '-lr`XFGh7NeZlr*r`g^w^`!o29gqkn85k9.LK~!Q6qIt;9L-<U[;(x^tcF)NPpvb' );
define( 'AUTH_SALT',         '9Yb?)DSt$`rTmnQ|e90%0jC[9=wp1` 8_>5R47kSHKf@FS00evz%$]faevYJmqMN' );
define( 'SECURE_AUTH_SALT',  ':saZnd}26K<lk`Xse3WmT+u<eFMd0BZ$L6!V0AuHskctYP+(ZB0bZ.-iH6?U[<%[' );
define( 'LOGGED_IN_SALT',    '(f_Q`B1L.>^)mGw.%D/yvrwqlqmg;U!,#43X3apZp9/_vY*DjCO!!FHng1KZs!U_' );
define( 'NONCE_SALT',        '|SwP]R,Zvs`QBXx||3mXW`KgOjhQfCfnE-5A*3xU%:=v@_U<)$hi-jAA6I>bDL,N' );
define( 'WP_CACHE_KEY_SALT', 'jphDqW =e1,mqt/[&%bD%^6+|6Fd0#?+0`,p;iYk.(miy3f!$axxx_u<ULeu 2ka' );


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
define( 'COOKIEHASH', '21b3b9ced997581c465a0e43f9719166' );
define( 'WP_AUTO_UPDATE_CORE', 'minor' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
