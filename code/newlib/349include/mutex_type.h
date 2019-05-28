#ifndef _MUTEX_H_
#define _MUTEX_H_

typedef volatile struct mutex_type{
    uint8_t mutex_ID;
    uint8_t locked;
    uint32_t max_prio;
    uint32_t holder;
    uint32_t blocking_BV;
} mutex_t;

#endif /* _MUTEX_H_ */