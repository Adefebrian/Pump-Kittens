<template>
  <div class="attr_tab">
    <div v-for="(attr, idx) in attributes" :key="'attr' + idx">
      <div class="category">
        <div class="text-h6">{{ attr.category }}</div>
      </div>
      <div v-for="(cat, c_idx) in attr.items" :key="'cat' + c_idx">
        <div class="d-flex align-items-center justify-space-between">
          <div>
            {{ c_idx + 1 }}.<u>{{ cat.name }}</u>
          </div>
          <div>{{ cat.count }} <span>/</span> {{ attr.total }}</div>
        </div>
        <div class="d-flex flex-nowrap imgRow">
          <img
            v-for="(img, i_idx) in cat.images"
            :key="'img' + i_idx"
            :src="img"
            class="img-attrb"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "attribute",
  data() {
    return {
      attributes: [
        {
          category: "Head types",
          total: 500,
          items: [
            {
              name: "Aliens",
              count: 10,
              images: [
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
              ],
            },
            {
              name: "Rounded",
              count: 150,
              images: [
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
              ],
            },
          ],
        },
        {
          category: "Accessories",
          total: 500,
          items: [
            {
              name: "Aliens",
              count: 10,
              images: [
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
              ],
            },
            {
              name: "Rounded",
              count: 150,
              images: [
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
                require("@/assets/pixelImage.png"),
              ],
            },
          ],
        },
      ],
    };
  },
};
</script>

<style scoped>
.img-attrb {
  object-fit: contain !important;
  width: 50px;
  height: 50px;
  margin: 2px;
}

.imgRow {
  padding: 16px;
  padding-top: 4px;
}

.category {
  padding-bottom: 10px;
}
</style>