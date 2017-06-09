$TTL    604800
@       IN      SOA     ns1.cs642-shu.com. admin.cs642-shu.com. (
                              2         ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
    IN      NS      ns1.cs642-shu.com.

; name servers - A records
ns1.cs642-shu.com.          IN      A       173.31.56.121

; 173.31.0.0/16 - A records
r1.cs642-shu.com.        IN      A       173.31.49.222
r2.cs642-shu.com.        IN      A       173.31.62.173
db1.cs642-shu.com.       IN      A       173.31.52.6
db2.cs642-shu.com.       IN      A       173.31.62.195
app1.cs642-shu.com.      IN      A       173.31.60.148
app2.cs642-shu.com.      IN      A       173.31.55.159

