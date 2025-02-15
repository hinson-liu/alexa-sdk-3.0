/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009-2010 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU General Public License Version 2
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

/**
 * SECTION:up-version
 * @short_description: Obtains the version for the installed UPower
 *
 * These compile time macros allow the user to enable parts of client code
 * depending on the version of libupower-glib installed.
 *
 * See also: #UpClient, #UpDevice
 */

#if !defined (__UPOWER_H_INSIDE__) && !defined (UP_COMPILATION)
#error "Only <upower.h> can be included directly."
#endif

#ifndef __UP_VERSION_H
#define __UP_VERSION_H

/**
 * UP_CHECK_VERSION:
 *
 * The compile-time major version
 */
#define UP_MAJOR_VERSION				(0)

/**
 * UP_CHECK_MINOR:
 *
 * The compile-time minor version
 */
#define UP_MINOR_VERSION				(99)

/**
 * UP_MICRO_VERSION:
 *
 * The compile-time micro version
 */
#define UP_MICRO_VERSION				(4)

/* check whether a UPower version equal to or greater than
 * major.minor.micro.
 */
#define UP_CHECK_VERSION(major,minor,micro)    \
    (UP_MAJOR_VERSION > (major) || \
     (UP_MAJOR_VERSION == (major) && UP_MINOR_VERSION > (minor)) || \
     (UP_MAJOR_VERSION == (major) && UP_MINOR_VERSION == (minor) && \
      UP_MICRO_VERSION >= (micro)))

#endif /* __UP_VERSION_H */
