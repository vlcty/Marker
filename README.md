Marker
===========

Tunnel output and highlight wanted fragments

The idea behind
===============

I like that grep has the ability to color output and fragments in text. The probleme: grep filters. I needed an application which tunnels every output and colors the needed fragments. I found an application written in python on GitHub named Rainbow (nicoulaj/rainbow) but it didn't work as expected.

Coloring fragments
==================

You can color fragments which are defined via the ``--mark`` argument. You can pass as many as you want to the application. Ever fragment matching will be colored. You can set the foreground- and background color if you want. Use the ``--color`` argument then. See examples for more information.

Available colors
================

The application uses the perl module Term::ANSIColor.

Some foreground colors which should always work:

```
black  red  green  yellow  blue  magenta  cyan  white
bright_black  bright_red      bright_green  bright_yellow
bright_blue   bright_magenta  bright_cyan   bright_white
```

And optionally some background colors:

```
on_black  on_red      on_green  on yellow
on_blue   on_magenta  on_cyan   on_white
on_bright_black  on_bright_red      on_bright_green  on_bright_yellow
on_bright_blue   on_bright_magenta  on_bright_cyan   on_bright_white
```

System wide install
===================

Using ``perl /path/to/marker.pl`` is annoying. But you can use it like a regular application! Copy ``marker.pl`` to ``/usr/bin`` and create a symlink:

``ln -s /usr/bin/marker.pl /usr/bin/marker``

You can use it now from everywhere with simply piping to ``marker``

Examples
========

Highlight hello in a file
-------------------------

``cat file.txt | perl marker.pl --mark "hello"``

Highlight hello in a file with cyan color
-----------------------------------------

``cat file.txt | perl marker.pl --mark "hello" --color "cyan"``

Highlight hello in a file with cyan background color
----------------------------------------------------

``cat file.txt | perl marker.pl --mark "hello" --color "on_cyan"``

Highlight hello in a file with white foreground and blue background
-------------------------------------------------------------------

``cat file.txt | perl marker.pl --mark "hello" --color "white on_blue"``

Follow a file and highlight and IP
----------------------------------

``tail -f /var/log/auth.log | perl marker.pl --mark "1.2.3.4"``

Multiple highlights
-------------------

``tail -f /var/log/auth.log | perl marker.pl --mark "number1" --mark "number2"``