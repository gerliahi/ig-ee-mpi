#### Authentication
- internal mikroservices: autentimisluba ("Authorization") - 
    pm.request.headers.add({key: "X-Author-Org-Id-Oid", value: pm.variables.get("AUTHOR_ORG_OID")});
    pm.request.headers.add({key: "X-Author-Org-Id", value: pm.variables.get("AUTHOR_ORG_ID")});
    pm.request.headers.add({key: "X-Author-Id", value: pm.variables.get("AUTHOR_ID")});
    pm.request.headers.add({key: "X-Author-Id-Oid", value: pm.variables.get("AUTHOR_OID")});
    pm.request.headers.add({key: "X-Author-Role", value: pm.variables.get("AUTHOR_ROLE")});
- external requests: kak v Horone
    info päringu teostatava isiku kohta ("x-road-userid") - 'x-road-userid: EE38912072255'
 