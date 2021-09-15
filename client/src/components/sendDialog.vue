<template>
    <div>
        <v-btn color="black" dark @click.stop="dialog = true"  outlined elevation="4" class="action" x-small>Send</v-btn>
        <v-dialog v-model="dialog" max-width="450">
            <v-card>
                <v-toolbar color="primary" dark>Transfering Pump Kitten</v-toolbar>
                <v-col sm="15">
                   <v-text-field v-model="recipientAddress" placeholder="To : Enter recipients address">
                    </v-text-field>
                </v-col>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="transferToken" color="green darken-1" text>
                    Send
                    </v-btn>
                   <v-btn color="green darken-1" text @click="dialog = false">
                    Close
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
  export default {
    data () {
      return {
        dialog: false,
        recipientAddress: null
      }
    },
    props: {
        id: {type: String}
    },
    mounted() {
    },
    methods: {
        transferToken() {         
            this.$store.dispatch('transferToken', {
                tokenID:this.id,
                to:this.recipientAddress
            })
        },
    }
  }
</script>