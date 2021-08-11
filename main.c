#include <stdio.h>

#include <sys/capability.h>

int main() {
	cap_t caps = cap_get_proc();
	puts(cap_to_text(caps, NULL));
	cap_free(caps);
}
