/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
*/

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/sysinfo.h>
#include <android-base/properties.h>
#include <android-base/logging.h>
#include <vector>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;
using std::string;

std::vector<string> ro_props_default_source_order = {
    "",
    "odm.",
    "product.",
    "system.",
    "system_ext.",
    "vendor.",
};

void property_override(string prop, string value) {
    auto pi = (prop_info*) __system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void set_ro_build_prop(const string &prop, const string &value, bool product = true) {
    string prop_name;

    for (const auto &source : ro_props_default_source_order) {
        if (product)
            prop_name = "ro.product." + source + prop;
        else
            prop_name = "ro." + source + "build." + prop;

        property_override(prop_name.c_str(), value.c_str());
    }
}

void set_build_fingerprint(string device, string name, string build) {
    string build_fingerprint;

    build_fingerprint = "samsung/" + name + "/" + device + ":10/QP1A.190711.020/" + build + ":user/release-keys";
    set_ro_build_prop("fingerprint", build_fingerprint, false);
    property_override("ro.bootimage.build.fingerprint", build_fingerprint);

    set_ro_build_prop("name", name);
    set_ro_build_prop("name", name, false);
    set_ro_build_prop("device", device);
    set_ro_build_prop("device", device, false);
}

void set_avoid_gfxaccel_config() {
    struct sysinfo sys;
    sysinfo(&sys);

    if (sys.totalram <= 3072ull * 1024 * 1024) {
        // Reduce memory footprint
        property_override("ro.config.avoid_gfx_accel", "true");
    }
}

void vendor_load_properties() {
    string model;

    model = GetProperty("ro.boot.product.model", "");
    if(model.empty()){
        model = GetProperty("ro.boot.em.model", "");
    }

    if (model == "SM-M205N") {
        set_build_fingerprint("m20", "m20kx", "M205NKSU6BUF2");
    } else if (model == "SM-M205F") {
        set_build_fingerprint("m20lte", "m20ltedd", "M205FDDU8CUD3");
    } else if (model == "SM-M205G") {
        set_build_fingerprint("m20lte", "m20ltedx", "M205GDXU7CUD2");
    } else if (model == "SM-M205M") {
        set_build_fingerprint("m20lte", "m20lteub", "M205MUBU8CUE1");
    } else if (model == "SM-M205FN") {
        set_build_fingerprint("m20lte", "m20lteeea", "M205FNEEU8CUG1");
        property_override("ro.boot.product.hardware.sku", "NFC");
    } else {
        LOG(ERROR) << __func__ << ": Coudn't indentify model!";
    }

    set_ro_build_prop("model", model);
    set_ro_build_prop("product", model, false);

    set_avoid_gfxaccel_config();
}
