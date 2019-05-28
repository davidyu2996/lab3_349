#ifndef _MUTEX_H_
#define _MUTEX_H_

typedef struct mutex_type{
    uint8_t locked;
    uint32_t max_prio;
    uint32_t holder;
} mutex_t;

#endif /* _MUTEX_H_ */