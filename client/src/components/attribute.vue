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
<!--          <img
            v-for="(img, i_idx) in cat.images"
            :key="'img' + i_idx"
            :src="img"
            class="img-attrb"
          />-->
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
          category: "Super rarity",
          total: 100,
          items: [
           {
              name: "Air Pods",
              count: 1,
             
            },
            {
              name: "Covid Mask",
              count: 4,
             
            },
            {
              name: "Crown",
              count: 5,
           
            },
            {
              name: "Horns",
              count: 9,
            
            },
            {
              name: "Rainbow",
              count: 3,
            
            },
          ],
        },
        {
          category: "Uniqueness",
          total: 100,
          items: [
            {
              name: "Bracelet",
              count: 6,
             
            },
            {
              name: "Glasses",
              count: 7,
              
            },
           {
              name: "Hair",
              count: 1,
             
            },
           {
              name: "Hairclip",
              count: 1,
            
            },
            {
              name: "Hat",
              count: 3,
             
            },
            {
              name: "Headband",
              count: 3,
            
            },
            {
              name: "Headphones",
              count: 4,
            
            },
            {
              name: "Necklace",
              count: 29,
             
            },
            {
              name: "Necklace & bracelet",
              count: 5,
             
            },
           {
              name: "Scarf",
              count: 9,
            
            },
           {
              name: "Singing",
              count: 2,
            
           },
          {
              name: "Tie",
              count: 2,
            
           },
           {
              name: "Watch",
              count: 4,
            
            },
          ],
        },
       {
          category: "Dress",
          total: 100,
          items: [
            {
              name: "Beach",
              count: 6,
            
            },
            {
              name: "Casual",
              count: 33,
           
            },
           {
              name: "Chef",
              count: 1,
            
            },
            {
              name: "Christmas",
              count: 2,
             
            },
             {
              name: "Detective",
              count: 1,
            
            },
            {
              name: "Party",
              count: 44,
           
            },
            {
              name: "Uniform",
              count: 2,
            
            },
            {
              name: "Winter",
              count: 11,
            
            },
          ],
        },
      {
          category: "Standout",
          total: 100,
          items: [
            {
              name: "Barefoot",
              count: 5,
            
            },
            {
              name: "Glasses & Hair",
              count: 3,
            
            },
            {
              name: "Hair",
              count: 7,
             
            },
            {
              name: "Hairband",
              count: 1,
            
            },
            {
              name: "Hairclip",
              count: 1,
             
            },
            {
              name: "Hat",
              count: 29,
           
            },
            {
              name: "Headband",
              count: 4,
             
            },
            {
              name: "Headphones",
              count: 1,
            
            },
            {
              name: "Love",
              count: 1,
            
            },

           {
              name: "Teeth",
              count: 5,
             
            },
           {
              name: "Waist chain",
              count: 1,
            
            },
          ],
        },
        {
          category: "Earrings",
          total: 100,
          items: [
            {
              name: "Diamond",
              count: 5,
            
            },
            {
              name: "Gold",
              count: 16,
            
            },
            {
              name: "Pearl",
              count: 12,
            
            },
          ],
        },
        {
          category: "Color",
          total: 100,
          items: [
            {
              name: "Black",
              count: 9,
            
            },
            {
              name: "Blue",
              count: 6,
            
            },
            {
              name: "Brown",
              count: 1,
            
            },
              {
              name: "Cyan",
              count: 4,
            
            },
            {
              name: "Green",
              count: 18,
             
            },
            {
              name: "Orange",
              count: 5,
             
            },
            {
              name: "Pink",
              count: 21,
             
            },
            {
              name: "Purple",
              count: 5,
             
            },
            {
              name: "Rainbow",
              count: 5,
             
            },
            {
              name: "Red",
              count: 7,
            
            },
            {
              name: "Skyblue",
              count: 4,
            
            },
            {
              name: "Violet",
              count: 4,
             
            },
            {
              name: "White",
              count: 4,
           
            },
            {
              name: "Yellow",
              count: 7,
            
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

.img-attrb {
  width:70px;
  height:70px;
  opacity: .8;
}
</style>