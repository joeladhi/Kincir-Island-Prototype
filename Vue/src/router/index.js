import { createRouter, createWebHistory } from "vue-router";

const routes = [
    {
        path: '/',
        name: 'Home',
        component: () => import ("../view/Home.vue")
    },
    {
        path: '/about',
        name: 'About',
        component: () => import ("../view/About.vue")
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;