/**
 * Copyright (C) 2011 - present by OpenGamma Inc. and the OpenGamma group of companies
 *
 * Please see distribution for license.
 */

#ifndef __inc_og_rstats_package_fudgemsg_h
#define __inc_og_rstats_package_fudgemsg_h

#include "RCallback.h"

class RFudgeMsg {
private:
	RFudgeMsg () { }
	~RFudgeMsg () { }
public:
	static SEXP GetAllFields (SEXP msg);
	static SEXP FromFudgeMsg (FudgeMsg msg);
	static FudgeMsg ToFudgeMsg (const CRCallback *poR, SEXP value);
	static SEXP SetSerialiseMode (SEXP on);
};

#ifdef GLOBALS
extern "C" {

	SEXP RPROC FudgeMsg_getAllFields1 (SEXP msg) {
		return RFudgeMsg::GetAllFields (msg);
	}

	SEXP RPROC FudgeMsg_setSerialiseMode1 (SEXP on) {
		return RFudgeMsg::SetSerialiseMode (on);
	}

}
#endif /* ifdef GLOBALS */

#endif /* ifndef __inc_og_rstats_package_fudgemsg_h */
